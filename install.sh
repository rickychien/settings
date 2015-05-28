#! /bin/bash

# install neobundle first if it is inexistent
if [ ! -d ~/.vim/bundle/.neobundle ]; then
  echo "Install NeoBundle..."
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
fi

echo "Link setting scripts to user home directory"

echo $(dirname $0)
BASEDIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS=('.gitconfig' '.hgrc' '.vimrc' '.zshrc')

for script in ${SCRIPTS[@]}
do
  echo "link $BASEDIR/$script to $HOME"
  ln -s -f $BASEDIR/$script $HOME
done

exit 0
