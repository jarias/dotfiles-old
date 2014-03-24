My (jarias) default dotfiles!

Use [homesick](https://github.com/technicalpickles/homesick) to install

# Prerequisites

* Install XCode command line tools

```
curl -O https://raw.githubusercontent.com/edify/macbooks/master/xcode-cli-tools.sh
chmod +x xcode-cli-tools.sh && ./xcode-cli-tools.sh
```

* Install homesick

```
sudo gem install homesick
```

# Installation

	homesick clone jarias/dotfiles
	homesick symlink dotfiles

# Post installation

* Install homebrew

```
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

* Bundle my default Brewfile

```
brew bundle ~/.config/homebrew/Brewfile

ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/elasticsearch/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/mariadb/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
```

* Install OH-MY-ZSH

```
curl -L http://install.ohmyz.sh | sh
```

* Install Ruby and default Gems

```
rbenv install 2.1.1
rbenv global 2.1.1
gem install bundler
rbenv rehash
cd ~/.gems && bundle install
```
# LICENSE:

Copyright (c) 2011 Julio Arias

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
