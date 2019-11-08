cd /etc/bash.bashrc
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

#Alias
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

bind -n M-Left select-pane -L >> .tmux.conf.local
bind -n M-Right select-pane -R >> .tmux.conf.local 
bind -n M-Up select-pane -U >> .tmux.conf.local
bind -n M-Down select-pane -D >> .tmux.conf.local
