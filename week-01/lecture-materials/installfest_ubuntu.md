# CodePlatoon Installfest

## What we'll cover
We are going to install everything that you will need for this course. Please do this in order!

1. Visual Studio Code & `code`
2. Understanding the Unix Environment
3. apt-get
4. sqlite3
5. postgres
6. Python

## VSCode with `code`

During installing, VSCode will add itself to your system's PATH envirnmental variable. This will allow you to open VSCode from the terminal by simply typing `code`. You can also open files in VSCode from the terminal by typing `code SOME_FILENAME`.



## apt-get
[Advanced Package Tool](https://en.wikipedia.org/wiki/APT_(software)), or APT, is a free-software user interface that works with core libraries to handle the installation, versioning and removal of software on Debian, Ubuntu, and related Linux distributions

### Update and Upgrading
The `update` command in apt-get will resynchronize your package index with their sources. This goes out to each software's source to check what updates are available.
The update require's elevated permissions. Therefore you'll need to run the command using `sudo` (super user do). The command will require your user password. It's the same password you used to login to your system.
```sh
$ sudo apt-get update -y
```
Now that apt-get has an updated list of current software, you'll want to upgrade anything that requires upgrading
```sh
$ sudo apt-get upgrade -y
```
## Installing `sqlite3`

```sh
$ sudo apt-get -y install sqlite3 libsqlite3-dev
```

## Installing `postgres` and Setting Yourself up as a User

```sh
$ sudo apt-get install -y postgresql libpq-dev
```
### Role (user) Creation
Create a PostgreSQL role (user) that matches your linux username
```sh
$ sudo -u postgres createuser --interactive
```
Enter your linux username and password. The interactive output should look like this:
```psql
Enter name of role to add: <linux-username>
Shall the new role be a superuser? (y/n) y
```
Create a default database for your new postgres roll
```sh
$ sudo -u postgres createdb <linux-username>
```
Set your role's password by entering the postgres command line interface
```sh
$ psql
```
with this command line enter `\password`. This will asked you to set a password followed by a confirmation. Exit the command line using `\q`

## Python
Python comes built in with Ubuntu, but it's not necessarly the same version we'll be using. 

install python3.7
```sh
$ sudo apt-get install -y python3.7
$ sudo apt-get install -y python3.7-dev
$ sudo apt-get install -y python3.7-venv
```

## Node Version Manager (NVM)
```sh
$ sudo apt-get install build-essential libssl-dev -y
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
```
open a new terminal and check if nvm is working by typing
```sh
$ nvm --version
```
you should see a printout with a verison number

###Node Package Manager (NPM)
next we'll use NVM to install NPM veison 12
```sh
$ nvm install 12
```
## Install `git` using Homebrew

```sh
$ sudo apt-get install git -y
```

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

## Updating your bash profile
### .bash_profile
```sh
alias python='python3.7'
alias pip='pip3'

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch) \[\033[00m\]$\[\033[00m\] "
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
```
### .bashrc
```sh
...
source ~/.bash_profile
```