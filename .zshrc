#RUN echo "alias d='dropbox'" >> ~/.zshrc
#RUN echo "alias src='. ~/.zshrc'" >> ~/.zshrc
#RUN echo "curl -L https://raw.githubusercontent.com/xiote/zsh/master/.zshrc -o ~/.MyZshrc;" >> ~/.zshrc
#RUN echo "source ~/.MyZshrc" >> ~/.zshrc

#project
pcnf(){
    rm -rf ~/github.com/xiote/vim
    mkdir -p ~/github.com/xiote/vim
    git clone http://github.com/xiote/vim ~/github.com/xiote/vim

    rm -rf ~/github.com/xiote/zsh
    mkdir -p ~/github.com/xiote/zsh
    git clone http://github.com/xiote/zsh ~/github.com/xiote/zsh

    rm -rf ~/github.com/xiote/karabiner
    mkdir -p ~/github.com/xiote/karabiner
    git clone http://github.com/xiote/karabiner ~/github.com/xiote/karabiner
}

# karabiner
kcnf(){
    rm -rf ~/.config/karabiner/karabiner.json
    curl -L https://raw.githubusercontent.com/xiote/karabiner/master/karabiner.json -o ~/.config/karabiner/karabiner.json
}

# vim
vcnf() {
    rm ~/.vimrc
    curl -L https://raw.githubusercontent.com/xiote/vim/master/.vimrc -o ~/.MyVimrc
    ln -s ~/.MyVimrc ~/.vimrc
    
    rm -rf ~/.vim/pack/plugins/start/vimwiki;
    git clone https://github.com/vimwiki/vimwiki.git ~/.vim/pack/plugins/start/vimwiki;
    
    rm -rf ~/.vim/pack/plugins/start/fugitive;
    git clone https://tpope.io/vim/fugitive.git ~/.vim/pack/plugins/start/fugitive;
    
    rm -rf ~/.vim/pack/plugins/start/ack.vim;
    #git clone https://github.com/mileszs/ack.vim.git ~/.vim/pack/plugins/start/ack.vim;
    
    rm -rf ~/.vim/pack/plugins/start/w3m.vim;
    #git clone https://github.com/yuratomo/w3m.vim.git ~/.vim/pack/plugins/start/w3m.vim;
}

#git
gcnf(){ 
    git config --global credential.helper cache
    git config --global user.name "xiote"
    git config --global user.email "xiote@nate.com"
}

