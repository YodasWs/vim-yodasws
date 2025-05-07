# vim-yodasws
Making Vim so Much Easier!

## Vim 8/9 Installation

1. Go to your user vim settings folder
	```shell
	# Linux/WSL
	cd ~/.vim

	# Windows 10/11
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
		# Linux/WSL
		ln -s ~/.vim/pack/github/start/vim-yodasws/.vimrc /usr/share/vim/vimrc

		# Windows 10/11
		ln -s /mnt/c/Users/[username]/vimfiles/pack/github/start/vim-yodasws/.vimrc /mnt/c/Users/[username]/vimfiles/_vimrc
		```
		
		ℹ️ On Windows 10/11, you might also want to connect the console/Ubuntu vimfiles with your GUI vimfiles:
		```shell
		sudo ln -s /mnt/c/Users/[username]/vimfiles/pack ~/.vim/vimfiles/pack
		```

	1. Source from your vimrc

		```vim
		# Linux/WSL
		source ~/.vim/pack/github/start/vim-yodasws/.vimrc

		# Windows
		source /mnt/c/Users/[username]/vimfiles/pack/github/start/vim-yodasws/.vimrc
		```
