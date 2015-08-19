#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval $(keychain --eval --agents ssh -Q --quiet id_rsa)

alias vi=vim
export EDITOR=vim

alias ls='ls --color=auto'
alias d='date +%Y%m%d'
alias ocaml='rlwrap -H ~/.ocaml_history -D 2 -s 10000 ocaml'
alias pacaur='echo "using aur4 pacaur" ; pacaur --domain aur4.archlinux.org'

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
txtrst='\e[0m'    # Text Reset
PS1="\D{%H%M} \[$txtgrn\]\h\[$txtrst\]:\w \$ "

export PATH=$PATH:/home/mitchell/usr/bin
export MANPATH=$MANPATH:/home/mitchell/usr/man

# Ocaml mischeif.
eval `opam config env`

# R mischeif.
export R_LIBS="/home/mitchell/.r_libs"
