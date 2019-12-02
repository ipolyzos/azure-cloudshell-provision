#!/bin/bash

set -e 

function install_zsh_plugin_syntax_highlighting(){
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Install zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting
}

function install_zsh_plugin_autosuggestions(){
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Install zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
}

function install_zsh_plugins(){
    install_zsh_plugin_autosuggestions
    install_zsh_plugin_syntax_highlighting
}

function install_zsh(){
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Install oh-my-zsh..."

    if [ -d "$HOME/.oh-my-zsh" ]; then rm -Rf $HOME/.oh-my-zsh; fi

    export CHSH="no"
    export RUNZSH="no"
    
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function download_bashrc(){
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Download .bashrc..."
    if [ -f "$HOME/.bashrc" ]; then rm -Rf $HOME/.bashrc; fi
    curl -LJo $HOME/.bashrc https://raw.githubusercontent.com/ipolyzos/azure-cloudshell-provision/master/.bashrc
}

function download_zshrc(){    
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Download .zshrc..."
    if [ -d "$HOME/.zshrc" ]; then rm -Rf $HOME/.oh-my-zsh; fi
    curl -LJo $HOME/.zshrc https://raw.githubusercontent.com/ipolyzos/azure-cloudshell-provision/master/.zshrc
}

function download_dotfiles(){
    download_bashrc
    download_zshrc
}

function install_krew(){
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Install k8s krew..."
    (
      set -x; cd "$(mktemp -d)" &&
      curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/download/v0.3.3/krew.{tar.gz,yaml}" &&
      tar zxvf krew.tar.gz &&
      KREW=./krew-"$(uname | tr '[:upper:]' '[:lower:]')_amd64" &&
      "$KREW" install --manifest=krew.yaml --archive=krew.tar.gz &&
      "$KREW" update
    )
    export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
    kubectl krew update
    kubectl krew list
}

function install_kubectl_plugins(){
    install_krew
}

function install_linkerd(){
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Install Linkerd CLI..."
    if [ -d "$HOME/.linkerd2" ]; then rm -Rf $HOME/.linkerd2; fi
    curl -sL https://run.linkerd.io/install | sh
}

download_dotfiles
install_zsh
install_kubectl_plugins
install_linkerd

source $HOME/.bashrc