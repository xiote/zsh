#RUN echo "alias d='dropbox'" >> ~/.zshrc
#RUN echo "alias src='. ~/.zshrc'" >> ~/.zshrc
#RUN echo "curl -L https://raw.githubusercontent.com/xiote/managed-files/master/.zshrc -o ~/.MyZshrc;" >> ~/.zshrc
#RUN echo "source ~/.MyZshrc" >> ~/.zshrc

# vi
vcnf() {
    
    rm ~/.vimrc
    curl -L https://raw.githubusercontent.com/xiote/managed-files/master/.vimrc -o ~/.MyVimrc
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

gcnf(){
    git config --global credential.helper cache
    git config --global user.name "xiote"
    git config --global user.email "xiote@nate.com"
}

