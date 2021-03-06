#[]==================================================================[]
#|                                                                    |
#|              .bash_profile                    by Masa-Michi Akashi |
#|                                                                    |
#|--------------------------------------------------------------------|
#|$Id: .bash_profile,v 1.1 1998/08/17 03:21:54 akashi Exp akashi $
#[]==================================================================[]
#[]------------------------------------------------------------------[]
#| Prompt
#[]------------------------------------------------------------------[]
if [ -n "$PS1" ]; then
    PS1='\u@\h(\W)> '
fi

LOGIN_SHELL=true
#[]------------------------------------------------------------------[]
#| Welcome message
#[]------------------------------------------------------------------[]
echo "Welcome to `hostname -s`, `whoami` "
id

#[]------------------------------------------------------------------[]
#| Read .bashrc
#[]------------------------------------------------------------------[]
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
