# This fork is no longer maintained

Unfortunately I am unable to devote any significant amount of time to
supporting this TextMate bundle.

I can merge any pull requests that come through until someone hopefully
volunteers to take over maintenance.

If you would like to help keep this bundle alive please contact me
through Github and we can discuss transferring ownership over to you.

---

# The Git Textmate Bundle.

## Installation

``` shell
mkdir -p ~/Library/Application\ Support/TextMate/Bundles
cd ~/Library/Application\ Support/TextMate/Bundles
git clone git://github.com/jcf/git-tmbundle.git Git.tmbundle
```

- In the TextMate preferences, advanced tab, shell variables, set the
  TM_GIT variable to point to your installation of git (ie
  `/usr/local/bin/git`)
- Many shortcuts are available from the Git-shortcut (Ctrl-Shift-G).
  Subversion commands are Command-Option-g. Less frequent commands are
  accessed via the menu.
- Update your bundle by running the "Update Git Bundle" command.

## Theme notes:

The "Git Commit Message" Language defines two scopes that can be used by
a theme to generate "line too long" warnings for the first line of the
commit:

- invalid.warning.line-too-long.git-commit
- invalid.error.line-too-long.git-commit

The warning scope triggers when the first line exceeds 50 characters;
the error scope over 65 characters. These aren't generally-used TextMate
scopes, so you can add new rules to your preferred themes, such as
orange background/red background. You can also edit the regex to change
the preferred character counts.

## Who:

### Previous Maintainers

- January 2010 - February 2012: [James
  Conroy-Finn](http://jamesconroyfinn.com/)
- January 2008 - December 2009: [Tim
  Harper](http://tim.theenchanter.com/) (with [Lead Media
  Partners](http://leadmediapartners.com)).

## Git-tmbundle superstars

The Git TextMate Bundle wouldn't be possible without the contributions
of the following fine gentlemen:

### Major Contributions

- **Allan Odgaard** - Started the bundle, got it rolling. Many patches.
  Oh, and TextMate :-).
- **Sam Granieri** - GitK, Many of the git-svn commands, Git initialize
  repository command, menu layouting, create-tag.
- **Johan S&oslash;rensen** - Contributing the CSS styling.

### Patches, etc

- **Tommi Asiala** - README file submission
- **Lawrence Pit** - Performance Enhancements
- **Jay Soffian** - Bug report with patch (missing environment variables)
- **Humberto Di&oacute;genes** - Git-svn fetch command
- **Lee Marlow**
- **Geoff Cheshire** - Textile'd the README to make it look good on GitHub
- **Martin Kühl** - Patch to allow committing into a git repository
  that's not the project root
- **Diego Barros** - new config options, usability improvements
- **Thomas Aylott** - Git commit language folding
- **Michael Sheets** - Usability improvements
- **Henrik Nyh** - Git 1.6 commit message compatibility and spelling corrections
- **Slava Kravchenko** - Ruby 1.9 compatibility
- **Adam Vandenberg** - First-line-too-long support

Please feel free to send a pull request if you've added any
functionality to this bundle that you think the rest of the git-loving,
TextMate-using world would appreciate!
