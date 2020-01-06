#RUN echo "alias d='dropbox'" >> ~/.zshrc
#RUN echo "alias src='. ~/.zshrc'" >> ~/.zshrc
#RUN echo "curl -L https://raw.githubusercontent.com/xiote/zsh/master/.zshrc -o ~/.MyZshrc;" >> ~/.zshrc
#RUN echo "source ~/.MyZshrc" >> ~/.zshrc

#git
gitcnf(){
    git config --global credential.helper cache
    git config --global user.name "xiote"
    git config --global user.email "xiote@nate.com"
}

#project
prjcnf(){
    rm -rf ~/github.com/xiote/vim
    mkdir -p ~/github.com/xiote/vim
    git clone http://github.com/xiote/vim ~/github.com/xiote/vim

    rm -rf ~/github.com/xiote/zsh
    mkdir -p ~/github.com/xiote/zsh
    git clone http://github.com/xiote/zsh ~/github.com/xiote/zsh

    rm -rf ~/github.com/xiote/karabiner
    mkdir -p ~/github.com/xiote/karabiner
    git clone http://github.com/xiote/karabiner ~/github.com/xiote/karabiner

    rm -rf ~/github.com/xiote/wiki
    mkdir -p ~/github.com/xiote/wiki
    git clone http://github.com/xiote/wiki ~/github.com/xiote/wiki
}



# karabiner
karacnf(){
    curl -L https://raw.githubusercontent.com/xiote/karabiner/master/karabiner.json -o ~/.config/karabiner/karabiner.json
}

# vim
vimcnf() {
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

#ub
ubzsh() {
    if [ $# -eq 0 ]
    then
        echo "ubzsh <linux|mb|mn>"
        return;
    fi
    docker exec -it --workdir /root $1 /bin/zsh
}

ubcnf() {
    if [ $# -eq 0 ]
    then
        echo "ubcnf <linux|mb|mn>"
        return;
    fi
    docker rm $1 -f;
    docker pull xiote78/ubuntu:18.04-custom;
    docker run -itd --hostname $1 --name $1 xiote78/ubuntu:18.04-custom /bin/bash;
    docker container ls -a;
}
