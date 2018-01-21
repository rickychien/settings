#! /bin/bash


if [ "$(echo $SHELL)" != "/bin/zsh" ]
then
  echo "Switch to zsh as default shell"
  chsh -s /bin/zsh
fi

if [ ! -d ~/.oh-my-zsh ]
then
  echo "Install oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "Create soft link from setting scripts to user home directory"

BASEDIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS=('.gitconfig' '.gitignore' '.vimrc' '.zshrc')

for script in ${SCRIPTS[@]}
do
  echo " * link $BASEDIR/$script to $HOME"
  ln -sf $BASEDIR/$script $HOME
done

exit 0
