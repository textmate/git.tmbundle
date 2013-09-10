module ConfigHelper
  def config_form_field(type, local_or_global, config_key, options = {})
    if type == "select"
      config_select_field(local_or_global, config_key, options)
    else
      config_text_field(local_or_global, config_key, options)
    end
  end

  def config_text_field(local_or_global, config_key, options = {})
    content_tag :input, {:type => "text", :value => git.config[local_or_global, config_key], :onchange => "dispatch({controller: 'config', action: 'set', scope: '#{local_or_global}', key: '#{config_key}', value: $F(this)})"}.merge(options)
  end

  def config_select_field(local_or_global, config_key, options = {})
    selected_value = git.config[local_or_global, config_key]
    if options[:select_options]
      select_options = options[:select_options].map do |value, label|
        if selected_value.to_s == value.to_s
          content_tag(:option, label, :value => value, :selected=>"selected")
        else
          content_tag(:option, label, :value => value)
        end
      end
    else
      select_options = []
    end

    content_tag(:select, select_options, {:mulitiple => false, :onchange => "dispatch({controller: 'config', action: 'set', scope: '#{local_or_global}', key: '#{config_key}', value: $F(this)})"}.merge(options).reject(:select_options))
  end
end
