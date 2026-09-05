function setup_neovim() {
	git clone -b v0.11.2 https://github.com/neovim/neovim.git $HOME/Personal/neovim
	brew install cmake gettext lua5.4 liblua5.4-0-dev

	cd $HOME/Personal/neovim
	make CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make install
}
