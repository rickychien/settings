#! /bin/bash

if [ "$(echo $SHELL)" != "/bin/zsh" ]
then
  echo "Switch to zsh as default shell..."
  chsh -s /bin/zsh
else
  echo "The default shell is zsh"
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [ ! -d /usr/local/Homebrew ]
then
  echo "Install Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew is installed, skipping..."
fi

if ! which node > /dev/null
then
  echo "Install NodeJS..."
  brew install node
else
  echo "NodeJS is installed, skipping..."
fi

echo "Install Pure + Purer prompt"
npm install --global pure-prompt
npm install --global purer-prompt

echo "Create soft link from setting scripts to user home directory"

BASEDIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS=('.gitconfig' '.gitignore' '.vimrc' '.zshrc')
SCRIPTS_DEST=$HOME

for script in ${SCRIPTS[@]}
do
  echo " * link $BASEDIR/$script to $SCRIPTS_DEST"
  ln -sf $BASEDIR/$script $SCRIPTS_DEST
done

VSCODE_SCRIPTS=('keybindings.json' 'settings.json')
VSCODE_SETTINGS_DEST="$HOME/Library/Application Support/Code/User"

for script in ${VSCODE_SCRIPTS[@]}
do
  echo " * link $BASEDIR/vscode/$script to $VSCODE_SETTINGS_DEST"
  ln -sf $BASEDIR/vscode/$script "$VSCODE_SETTINGS_DEST"
done

exit 0
