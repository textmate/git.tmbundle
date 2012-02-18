# The Git Textmate Bundle.

## I am no longer supporting this Bundle

This bundle has not been tested with TextMate 2. It may very well work,
but I will not be fixing any issues that may exist.

---

Release 1.8.0 [2009-07-31]

[James Conroy-Finn](http://github.com/jcf) is the new maintainer of this bundle. If you have cloned the bundle from Tim Harper's repository, please update your git config settings to point to his repository:

``` shell
cd ~/Library/Application\ Support/TextMate/Bundles/Git.tmbundle
git config remote.origin.url git://github.com/jcf/git-tmbundle.git
```

Thanks -- the management

## Installation

``` shell
mkdir -p ~/Library/Application\ Support/TextMate/Bundles
cd ~/Library/Application\ Support/TextMate/Bundles
git clone git://github.com/jcf/git-tmbundle.git Git.tmbundle
```

- In the TextMate preferences, advanced tab, shell variables, set the TM_GIT variable to point to your installation of git (ie `/usr/local/bin/git`)
- Many shortcuts are available from the Git-shortcut (Ctrl-Shift-G). Subversion commands are Command-Option-g. Less frequent commands are accessed via the menu.
- Update your bundle by running the "Update Git Bundle" command.

## Support

- [Issue tracker](http://github.com/jcf/git-tmbundle/issues)
- [Repository](http://github.com/jcf/git-tmbundle)

The [Mailing list](http://groups.google.com/group/git-tmbundle) has now been closed. Please feel free to report issues using the [Issue tracker](http://github.com/jcf/git-tmbundle/issues).

## Theme notes:

The "Git Commit Message" Language defines two scopes that can be used by a theme to generate "line too long" warnings for the first line of the commit:

- invalid.warning.line-too-long.git-commit
- invalid.error.line-too-long.git-commit

The warning scope triggers when the first line exceeds 50 characters; the error scope over 65 characters. These aren't generally-used TextMate scopes, so you can add new rules to your preferred themes, such as orange background/red background. You can also edit the regex to change the preferred character counts.

## Who:

### Maintainer, Lead Developer:

- January 2010 - present: [James Conroy-Finn](http://jamesconroyfinn.com/)

### Previous Maintainers

- January 2008 - December 2009: [Tim Harper](http://tim.theenchanter.com/) (with [Lead Media Partners](http://leadmediapartners.com)).

## Git-tmbundle superstars

The Git TextMate Bundle wouldn't be possible without the contributions of the following fine gentlemen:

### Major Contributions

- **Allan Odgaard** - Started the bundle, got it rolling. Many patches. Oh, and TextMate :-).
- **Sam Granieri** - GitK, Many of the git-svn commands, Git initialize repository command, menu layouting, create-tag.
- **Johan S&oslash;rensen** - Contributing the CSS styling.

### Patches, etc

- **Tommi Asiala** - README file submission
- **Lawrence Pit** - Performance Enhancements
- **Jay Soffian** - Bug report with patch (missing environment variables)
- **Humberto Di&oacute;genes** - Git-svn fetch command
- **Lee Marlow**
- **Geoff Cheshire** - Textile'd the README to make it look good on GitHub
- **Martin Kühl** - Patch to allow committing into a git repository that's not the project root
- **Diego Barros** - new config options, usability improvements
- **Thomas Aylott** - Git commit language folding
- **Michael Sheets** - Usability improvements
- **Henrik Nyh** - Git 1.6 commit message compatibility and spelling corrections
- **Slava Kravchenko** - Ruby 1.9 compatibility
- **Adam Vandenberg** - First-line-too-long support

Please feel free to send a pull request if you've added any functionality to this bundle that you think the rest of the git-loving, TextMate-using world would appreciate!
