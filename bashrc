#[]==================================================================[]
#|                                                                    |
#|              .bashrc                          by Masa-Michi Akashi |
#|                                                                    |
#|--------------------------------------------------------------------|
#|$Id$
#[]==================================================================[]

#[]------------------------------------------------------------------[]
#| Path
#[]------------------------------------------------------------------[]
PATH=/usr/local/bin:$PATH:/usr/sbin:/sbin:~/bin

#[]------------------------------------------------------------------[]
#| window title
#[]------------------------------------------------------------------[]
case $TERM in
    ?term*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@`hostname -s`\007"'
        ;;
    *)
        ;;
esac

#[]------------------------------------------------------------------[]
#| aliases
#[]------------------------------------------------------------------[]
alias file='file -h'
alias df='df -k'
alias ls='ls -LF'
#alias top='top -o cpu'

#[]------------------------------------------------------------------[]
#| functions
#[]------------------------------------------------------------------[]

#
# rotate files
#
rot () {
        if [ @$1 = @ ]; then
                echo "usage: rot $1"
        fi
        mv $1 $1.dist
        cp $1.dist $1
}
