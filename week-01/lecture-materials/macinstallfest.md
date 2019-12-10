# Mac OS Installfest

## What we'll cover
We are going to install everything that you will need for this course. Please do this in order!

1. Visual Studio Code & `code`
2. Understanding the Unix Environment
3. Homebrew
4. sqlite3
5. postgres
6. Python

## Visual Studio Code
* VSCode Settings / Extensions
  * Make these your settings under Code -> Preferences -> Settings in VSCode:
  ```
  {
    "editor.fontSize": 14,
    "editor.multiCursorModifier": "ctrlCmd",
    "editor.renderLineHighlight": "gutter",
    "editor.tabSize": 2,
    "editor.wordWrap": "on",
    "explorer.confirmDelete": false,
    "explorer.confirmDragAndDrop": false,
    "files.autoSave": "onFocusChange",
    "window.zoomLevel": 0,
    "workbench.colorTheme": "Visual Studio Dark",
    "workbench.iconTheme": "vscode-icons",
    "workbench.startupEditor": "newUntitledFile",
    "[python]": {
      "editor.insertSpaces": true,
      "editor.tabSize": 4  
    },
   
  }
  ```
* Extensions are tools to make your job as a developer easier. Please install these:
  * Sublime Text Keymap and Settings Importer
  * Beautify
  * VSCode Icons
  * Bracket Pair Colorizer
  * Path IntelliSense
  * Preview on web server
  * Python

## `code`

This is a command that allows you to open a file or directory in your VSCode text editor from the command line. After installing VSCode from the website and putting it in your applications folder, please follow these instructions up to and including `Restart the terminal`: https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line

This creates a symbolic link for your command line and you can run `code SOME_FILENAME` to open a file or folder in VSCode.

## Homebrew

First let's ensure we've installed homebrew correctly.

```sh
$ which brew
/usr/local/bin/brew
```

If you don't see this, run:

```sh
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Homebrew is going to do a lot of work for us in that it manages our software versions, so always ensure that it's up-to-date and that it's healthy.

```sh
$ brew update
```

and

```sh
$ brew doctor
```

`brew doctor` may tell you a lot of stuff… you'll want to read through each item, and attempt to resolve the issue for Homebrew. Warnings are good to read but are not mandatory to fix. We're ideally shooting for a message like this:

```sh
$ brew doctor
Your system is ready to brew.
```

## Adjusting $PATH for Homebrew

Homebrew is going to be installing packages and tools for us, so we need to make sure that when possible, our system is using homebrew's installed packages.

We'll start by inspecting our path

```sh
$ echo $PATH | tr : '\n'
/Users/jon/bin
/usr/local/bin
/usr/bin
/bin
/usr/sbin
/sbin
/usr/local/bin
```

Ensure that `/usr/local/bin` comes before `/usr/bin` and `/bin`.

If it doesn't, open `$HOME/.bash_profile` using VSCode and add the
following:

```
export PATH="/usr/local/bin:$PATH"
```

Also check out the [rbenv documentation](https://github.com/sstephenson/rbenv).

## Installing `sqlite3` using Homebrew

```sh
$ brew install sqlite3
```

## Installing `postgres` using Homebrew

```sh
$ brew install postgres
```

`postgres` is a piece of software that requires a server to interface with. It's
easiest to let OS X's `launchd` utility keep this server running, otherwise we'd
have to restart it every time it died or our machine rebooted.

```sh
$ ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
$ launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
````

```sh
$ which postgres
/usr/local/bin/postgres
````

```sh
$ which psql
/usr/local/bin/psql
```

Now Homebrew will keep our postgres server alive so that we can just develop
awesome apps and not worry about the database. Let's ensure that we have a
server running. To do that we'll use `ps`:

```sh
$ ps aux | grep postgres

### As long as anything shows up on the screen, you will be fine. You don't need to match up with my output below

jon              444   0.0  0.0  2439324    148   ??  Ss   13Feb14   0:02.33 postgres: stats collector process
jon              443   0.0  0.0  2443176    624   ??  Ss   13Feb14   0:02.44 postgres: autovacuum launcher process
jon              442   0.0  0.0  2443044     80   ??  Ss   13Feb14   0:03.72 postgres: wal writer process
jon              441   0.0  0.0  2443044    132   ??  Ss   13Feb14   1:29.90 postgres: writer process
jon              440   0.0  0.0  2443044    136   ??  Ss   13Feb14   0:00.14 postgres: checkpointer process
jon              403   0.0  0.0  2443044     68   ??  S    13Feb14   0:00.40 /usr/local/opt/postgresql/bin/postgres -D /usr/local/var/postgres -r /usr/local/var/postgres/server.log
jon             6469   0.0  0.0  2432768    600 s000  R+    5:42PM   0:00.00 grep postgres
```

The process with `pid` (process id) #403 is our server process. You can see here
what executable (the full path) is running, where the data file is (ie.
`/usr/local/var/postgres`), and where we can find the logs (ie.
`/usr/local/var/postgres/server.log`).

Finally, create a default database and test our postgres client, `psql`.

```sh
createdb $USER
psql $USER # this is a sql console for interacting with a postgres database
enter `\q` to quit
```

## Python
Python comes built in with Mac, but it's an old version. You could download it directly from the Python [website](https://www.python.org/downloads/), but we are developers now! Let's download it using Homebrew so that one single package manager handles everything:
```sh
$ brew install python
```

Please note that it will take a while to install the most recent version of Python on your computer. Once it's finished, type in type `python` at your Command Line. Despite installing the most recent version of Python on your machine, your Terminal still likes using the old version. Teach it that you will tell it what to do by adding `export PATH="/usr/local/opt/python/libexec/bin:$PATH"` to your bash profile:

```sh
$ touch ~/.bash_profile
$ code ~/.bash_profile
# Paste the code above
$ source ~/.bash_profile
```

Try typing `python` at your Terminal again and see that the version changed from Python 2 to 3!

## Node Version Manager
```sh
$ brew install nvm
```
Open your bash profile by running:
```sh
$ code ~/.bash_profile
```
In there, paste:
```
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"
```
From there, reload the bash profile: `source ~/.bash_profile`.

Next, install the current version of [Node](https://nodejs.org/en/about/releases/). As of 5/29/19, it's version 12:
```sh
$ nvm install 12
```

## Install `git` using Homebrew

```sh
$ brew install git
```

Ensure we're using `git` from homebrew:
```sh
$ which git
/usr/local/bin/git
```

Question: _OS X ships with `git` isn't that good enough?_
Answer: It might be, but it's likely out of date, and you won't benefit from new
tools and developments. `git` is a tool we'll use frequently, so installing it
and keeping it up to date is akin to a chef keeping their knives sharp. Up-to-date
tools are one of the marks of a craftsman; strive to be a craftsman.

There are a few steps you should configure so git works well. 
The first, is setting up a global .gitignore file:

```sh
touch  ~/.gitignore_global
```

Using [Github's Gitignore Guide](https://help.github.com/articles/ignoring-files/#create-a-global-gitignore), we are going to set up the file for our computer:

```sh
$ git config --global core.excludesfile '~/.gitignore_global' 
```

Next, You'll want to get your gitconfig setup to recognize your github credentials:
1. Set up your command line Git [username](https://help.github.com/articles/setting-your-username-in-git/)
2. Set up your command line Git user [email](https://help.github.com/articles/setting-your-commit-email-address-in-git/)
3. Cache your Github [password](https://help.github.com/articles/caching-your-github-password-in-git/) so that you don't have to type it in every single time you push to Github

Finally, ensure that VSCode is your global text editor for all things Git:

```sh
$ git config --global core.editor "code -n -w"
``` 

Confirm `gitconfig` is set up, both for your username/email and gitignore by running `git config --global -l`
You should see that your username, email, gitignore, and editor are all listed.

## Install `bash` using Homebrew

```sh
$ brew install bash
```

To use this new version of bash, we'll need to add it to `/etc/shells`.
`/etc/shells` is owned by the `root` user (verify using `ls -la /etc/shells`),
so we'll need to use `sudo` to write to it.

```sh
$ code /etc/shells
```

Add `/usr/local/bin/bash` to the last line and save.

Now we need to change our shell command:

```sh
$ chsh -s /usr/local/bin/bash
```

All set. We can launch a new teminal window and verify our setup.

```sh
$ bash --version
```
