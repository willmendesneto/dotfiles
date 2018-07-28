
alias la="ls -la"
alias srm="sudo rm -rf"
alias smkdir="sudo mkdir"

# Reload the shell (i.e. invoke as a login shell)
alias reloadshell="exec $SHELL -l"

# Concatenate and print content of files (add line numbers)
alias catn="cat -n"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

alias v="vim"
alias o="open"
alias d="devtodo -A"
alias s="sudo subl"
alias subl="sudo subl"

# File size
alias fs="stat -f \"%z bytes\""

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ifconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"


# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ls="ls -la -G"

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias update="sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; gem update --system; gem update"

alias chrome-insecure="open -a Google\ Chrome --args --disable-web-security --user-data-dir"
alias ci="open -a Google\ Chrome --args --disable-web-security --user-data-dir"
