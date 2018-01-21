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

for script in ${SCRIPTS[@]}
do
  echo " * link $BASEDIR/$script to $HOME"
  ln -sf $BASEDIR/$script $HOME
done

exit 0
