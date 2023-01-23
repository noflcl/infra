{ config, pkgs, ... }:

{
  environment.interactiveShellInit = ''
    export PS1="\n\[\033[1;32m\][\[\e]0;\u@\h:\w\a\]\u @ \h:\w]\n $ \[\033[0m\]"

    alias sd='sudo docker'
    alias dc='sudo docker compose'
    alias dlog='sudo docker logs -f $1'

    alias openport="sudo ss -ltnp"
    alias wanip="curl http://ipecho.net/plain; echo"
    alias intban="grep wlp0s20f3 /proc/net/dev"
    alias net-default="ip -o -4 route show to default | awk '{print $5}'"

    alias vi="vim"
    alias gitclean="git rm -r --cached . && git add ."

    alias weather="curl wttr.in/YYC"
    alias moon="curl wttr.in/moon"

    alias lsl="ls -lhFA | less"
    alias df="df -Tha --total"
    alias du="du -ach | sort -h"
    alias free="free -mt"
    alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
    alias mkdir="mkdir -pv"
    alias wget="wget -c"
    alias histg="history | grep"

    mkd () {
      mkdir -p $1
      cd $1
    }

    shreddir () {
      find "$1" -type f -exec shred {} \;
    }
  '';
}
