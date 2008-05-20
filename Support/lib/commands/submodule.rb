require 'md5'
require 'fileutils'

class SCM::Git::Submodule < SCM::Git::CommandProxyBase
  def init_and_update
    output = initialize_all
    output << @base.command("submodule", "update")
    output
  end
  
  def initialize_all
    @base.command("submodule", "init")
  end
  
  def update(which = nil)
    which = which.path if which.is_a?(SubmoduleProxy)
    args = ["submodule", "update"]
    args << which if which
    @base.command(*args)
  end
  
  def all(options = {})
    list(options).map do |sm|
      SubmoduleProxy.new(@base, self, sm)
    end
  end
  
  def add(repository, path)
    path = @base.make_local_path(path)
    @base.popen_command("submodule", "add", "--", repository, path)
  end
  
  protected
    def list(options = {})
      args = ["ls-files", "--stage"]
      args << options[:path] if options[:path]
      @base.command(*args).split("\n").grep(/^160000 /).map do |line|
        next unless line.match(/^160000\s*([a-f0-9]+)\s*([0-9]+)\s*(.+)/)
        {
          :revision => $1,
          :path => $3
        }
      end.compact
    end
    
  class SubmoduleProxy
    attr_reader :revision, :path, :tag, :state
  
    def initialize(base, parent, options = {})
      @base, @parent, @tag = base, parent, tag
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
    
    def url
      @url ||= @base.command("config", "--file", File.join(@base.path, ".gitmodules"), "submodule.#{path}.url").strip
    end
    
    def name
      path
    end
    
    def abs_cache_path
      @abs_cache_path ||= File.join(@base.path, ".git/submodule_cache", MD5.hexdigest(path + "\n" + url))
    end
    
    def abs_path
      @abs_path ||= File.join(@base.path, @path)
    end
    
    def cache
      if File.exist?(abs_path)
        FileUtils.rm_rf(abs_cache_path)
        FileUtils.mkdir_p(File.dirname(abs_cache_path))
        FileUtils.mv(abs_path, abs_cache_path, :force => true)
        true
      end
    end
    
    def restore
      if File.exist?(abs_cache_path) && ! Dir.has_a_file?(abs_path)
        FileUtils.rm_rf(abs_path)
        FileUtils.mkdir_p(File.dirname(abs_path))
        FileUtils.mv(abs_cache_path, abs_path, :force => true)
      end
    end
    
    def git
      @git ||= @base.with_path(abs_path)
    end
    
    def current_revision(reload = false)
      @current_revision = nil if reload
      @current_revision ||= git.current_revision
    end
    
    def current_revision_description
      @current_revision_description ||= git.describe(current_revision)
    end
    
    def revision_description
      @revision_description ||= git.describe(revision)
    end
    
    def modified?
      current_revision != revision
    end
    
    def update
      @base.submodule.update(self)
    end
  end
end

class Dir
  def self.has_a_file?(abs_path)
    Dir[abs_path + "/**/*"].any? {|f| File.file?(f) }
  end
end