# vim-yodasws
Making Vim so Much Easier!

## Vim 8 Installation

1. Go to `vimfiles` folder
	```shell
	# Linux
	cd /usr/share/vim/vimfiles/

	# Windows 10
	cd /mnt/c/Users/[username]/vimfiles/
	```

1. Clone git repo

	```shell
	mkdir -pv pack/github/start
	cd pack/github/start

	git clone git@github.com:YodasWs/vim-yodasws.git
	```

1. Link vimrc

	Two options:

	1. Link files

		```shell
		# Linux
		ln -s /usr/share/vim/vimfiles/pack/github/start/vim-yodasws/.vimrc /usr/share/vim/vimrc

		# Windows 10
		ln -s /mnt/c/Users/[username]/vimfiles/pack/github/start/vim-yodasws/.vimrc /mnt/c/Users/[username]/vimfiles/_vimrc
		```
		
		ℹ️ On Windows 10, you'll probably also want to connect the console/Ubuntu vimfiles with your GUI vimfiles:
		```shell
		sudo ln -s /mnt/c/Users/[username]/vimfiles/pack /usr/share/vim/vimfiles/pack
		```

	1. Source from your vimrc

		```vim
		source $VIM/vimfiles/pack/github/start/vim-yodasws/.vimrc
		```
