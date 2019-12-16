# Installfest

## What we'll cover
We are going to install everything that you will need for this course. Please do this in order!

1. Visual Studio Code
2. Docker
3. Understanding the Unix Environment

## Visual Studio Code
* VSCode Settings / Extensions
  * Make these your settings under Code(File in Windows) -> Preferences -> Settings in VSCode: on the top right, there will be an icon which, on hover, will show Open Settings (JSON). Click that button and make these your settings:
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
  * vscode-icons
  * Bracket Pair Colorizer
  * Path IntelliSense
  * Preview on Web Server

## Make a Folder for all your code

Using your preferred GUI file manager (usually Finder on Mac and File Explorer on PC), navigate to your Desktop and make a folder that will contain ALL OF YOUR CODE. Let's name the folder `code_platoon`.

## Docker

First, make sure you have [Docker Desktop](https://www.docker.com/products/docker-desktop) installed.

You'll have to sign up for an account. Once you have it up and running, you'll have their whale icon in your menu/task bar.

In VSCode, open your `Desktop` or `code_platoon` folder so you can view the contents in the side pane. `control + backtick` will open a command prompt. At the command prompt, enter this command:

```
docker pull codeplatoon/base
```

This download may take a little while depending on your internet speeds.

Now, at the command line, use `cd` and `ls` to navigate to the `code_platoon` directory you made earlier.

Inside the `code_platoon` directory, run this command:

```
Mac:
docker run -it -v $(pwd):/usr/local/src/code_platoon codeplatoon/base

Windows:
docker run -it -v ${pwd}:/usr/local/src/code_platoon codeplatoon/base
```

Windows users will have to give permission for directory access.

You should see your prompt change! You've left your host prompt, and you're now at the container prompt. In the container prompt, enter this command:
```
touch .bashrc
```

`touch` is Unix code for 'create a new file'. In your VSCode side pane, you should see a new file pop up called `.bashrc`.

In `.bashrc` paste in the following contents:

```
# /root/.bashrc: executed by bash(1) for non-login shells. Login shells use ~/.bash_profile


# Set git name and email
git config --global user.name "Mona Lisa"
git config --global user.email "email@example.com"

# Keep username/password stored in container
git config --global credential.helper store
# The below command is more secure, storing in memory rather than on disk. However, you'll need to reenter your credentials each time you restart your container, or after so many seconds (604800 = 1 week)
# git config --global credential.helper 'cache --timeout=604800'


# Jon's colors
function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
function git_branch {
  [[ $(parse_git_branch) != "" ]] && echo "($(parse_git_branch))"
}
export PS1="\[\e[36m\]\u\[\e[m\]@\[\e[32m\]\h:\[\e[33;1m\]\w\[\e[m\]\$(git_branch) $ "


# Make `ls` colorized:
export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS'

# Additional `ls` helpers below, uncomment if you like
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'


# To start postgresql server in every instance, uncomment the line below:
# service postgresql start
# The line below needs to be run only once
# su postgres -c "createuser -s root"


# Windows users uncomment the line below to enable hotloading in React
# export CHOKIDAR_USEPOLLING=true

```

If you edited your VSCode settings earlier, the file will autosave. If not, save the file manually.

Now, `exit` out of your container prompt by typing in the command `exit` or press `control + d`.

At your host prompt (at the `code_platoon` directory), enter this command:

```
Mac:
docker run -it --name codePlatoon -v $(pwd):/usr/local/src/code_platoon -v $(pwd)/.bashrc:/root/.bashrc codeplatoon/base

Windows:
docker run -it --name codePlatoon -v ${pwd}:/usr/local/src/code_platoon -v ${pwd}/.bashrc:/root/.bashrc codeplatoon/base
```

Now, if you `exit` again, you can enter the container with a much shorter command:

```
docker start -i codePlatoon
```

You'll be using the above command to start your container for the next few weeks.

## Understanding the Unix Environment

Make sure you are at your container prompt. If you type in this command `git config --global user.name`, you'll get the response `Mona Lisa`. This is because your `.bashrc` file is run every time you start a terminal, or start your container. Edit your `.bashrc` to set your name (not Mona Lisa) and change example@email.com to the email that you use to log in to GitHub.

Even with the file saved, `git config --global user.name` still returns `Mona Lisa`. However, if you `exit` out of the container to your host prompt and start the container again with `docker start -i codePlatoon`, you'll find that `git config --global user.name` is now your name!

Remember: every line in your `.bashrc` is run before your terminal instance starts, but you have to start a new instance to see those new changes.


