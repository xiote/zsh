#RUN echo "alias src='. ~/.zshrc'" >> ~/.zshrc
#RUN echo "rm ~/.MyZshrc" >> ~/.zshrc
#RUN echo "curl -L https://raw.githubusercontent.com/xiote/zsh/master/.zshrc -o ~/.MyZshrc;" >> ~/.zshrc
#RUN echo "source ~/.MyZshrc" >> ~/.zshrc
# locale
# https://www.44bits.io/ko/post/setup_linux_locale_on_ubuntu_and_debian_container
#RUN echo "export LC_ALL=C.UTF-8" >> ~/.zshrc

alias cl='clear'
alias cdgo='cd ~/go/workspace/src/github.com/xiote/'

alias gcloudcomputeinstancescreate='gcloud compute instances create'
alias createinstance='gcloud compute instances create'
alias crinst='gcloud compute instances create'

alias gitinit='git init'
alias gitadd='git add'
alias gitcommit='git commit'
alias gitpull='git pull'
alias gitpush='git push'
alias gitlog='git log'
alias gitstatus='git status'

alias ansibleplaybook='ansible-playbook'
alias playbook='ansible-playbook'
alias pb='ansible-playbook'

# kubenates
alias m='minikube'
alias rmpd='kubectl delete pods'
alias rmsv='kubectl delete svc'
alias rmdp='kubectl delete deployments'
alias cf='kubectl create -f'
alias rmf='kubectl delete -f'
alias wpd='watch kubectl get pods --all-namespaces'
alias dspd='kubectl describe pods'
alias k='kubectl'
alias edcf='kubectl edit configmap'
alias af='kubectl apply -f'
alias edpd='kubectl edit pods'
alias lgpd='kubectl logs -f'
alias bspd='kubectl exec -it'
alias edsv='kubectl edit svc'
alias dssv='kubectl describe svc'
alias lpd='kubectl get pods --all-namespaces'
alias rmcfn='kubectl delete configmap --all -n'
alias ldp='kubectl get deployments --all-namespaces'
alias lsc='kubectl get secrets --all-namespaces'
alias rmscn='kubectl delete secrets --all -n'
alias lsv='kubectl get svc --all-namespaces'
alias rmsvn='kubectl delete svc --all -n'
alias lcf='kubectl get configmap --all-namespaces'
alias lac='kubectl get serviceaccount --all-namespaces'
alias rmacn='kubectl delete serviceaccount --all -n'
alias rmrl='kubectl delete clusterroles'
alias lrl='kubectl get clusterroles'
alias rmpvn='kubectl delete pv --all -n'
alias rmpdn='kubectl delete pods --all -n'
alias rmdpn='kubectl delete deployments --all -n'
alias cfvw='kubectl config view'
alias pf='kubectl port-forward'
alias lst='kubectl get statefulset --all-namespaces'
alias rmst='kubectl delete statefulset --all -n'
afc() { af http://gitlab.krei.co.kr:90/nextep/k8s/raw/master/$1;}
rmfc() { rmf http://gitlab.krei.co.kr:90/nextep/k8s/raw/master/$1;}
alias lpdn='kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName --all-namespaces'
alias pfpd='kubectl port-forward --address 192.168.0.111'
alias pfsv='kubectl port-forward --address 192.168.0.111'
alias dsnd='kubectl describe node'
alias lnd='kubectl get nodes'

#go
export GOPATH=~/go/workspace
export PATH=$PATH:$GOPATH/bin

#git
gitcnf(){
    git config --global credential.helper cache
    git config --global user.name "xiote"
    git config --global user.email "xiote@nate.com"
    git config --global alias.cout checkout 
    git config --global alias.br branch
    git config --global alias.st status
    git config --global core.editor "vim"
}

#project
projcnf(){
    rm -rf ~/github.com/xiote
    git clone http://github.com/xiote/vim ~/github.com/xiote/vim
    git clone http://github.com/xiote/zsh ~/github.com/xiote/zsh
    git clone http://github.com/xiote/karabiner ~/github.com/xiote/karabiner
    git clone http://github.com/xiote/wiki ~/github.com/xiote/wiki
    git clone http://github.com/xiote/ubuntu ~/github.com/xiote/ubuntu
    git clone http://github.com/xiote/myvim ~/github.com/xiote/myvim
    git clone http://github.com/xiote/ansible ~/github.com/xiote/ansible
}



# karabiner
karacnf(){
    rm ~/.config/karabiner/karabiner.json
    curl -L https://raw.githubusercontent.com/xiote/karabiner/master/karabiner.json -o ~/.config/karabiner/karabiner.json
}

# vim
vimcnf() {
    rm -rf ~/.vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        
    rm ~/.vimrc
    curl -L https://raw.githubusercontent.com/xiote/vim/master/.vimrc -o ~/.vimrc

#    mkdir -p ~/.vim/pack/plugins/start

#    git clone https://github.com/vimwiki/vimwiki.git ~/.vim/pack/plugins/start/vimwiki;
#    git clone https://tpope.io/vim/fugitive.git ~/.vim/pack/plugins/start/fugitive;
#    git clone https://github.com/xiote/link.vim.git ~/.vim/pack/plugins/start/link.vim;
#    git clone https://github.com/vim-syntastic/syntastic.git ~/.vim/pack/plugins/start/syntastic
#    git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
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
