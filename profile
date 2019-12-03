# alias mongod='mongod --dbpath /Users/tallrice/__LU/__CPSC-555_DistComp/5/data/db --bind_ip 127.0.0.1'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
alias mongod='mongod --dbpath /Users/tallrice/__LU/__CPSC-555_DistComp/5/data/db --bind_ip localhost'
# alias mongod='mongod --bind_ip 127.0.0.1'
alias mongo='mongo --host 127.0.0.1:27017'
# alias mongo='mongo'
#                                #  #                                # 
#                                #  #                                # 
##################################  ################################## 
##################################  ################################## 
##################################  #                      ########### 
#                  #             #                   ################# 
#                  #             #               ###################
                   #             #         ###################
                   #             #   ###################
                   ##           ##   ############## 
                   ##           ##          ####### 
                   ###         ###                 ####### 
                    ###       ####                      #######
                    #############   #                         ####### 
                     ###########    ################################## 
                        #####       ################################## 
#                  #                ################################## 
####################                ################################## 
####################                #                                # 
####################                    ### 
#             ###                     ########
                ##                   ##########   ##### 
                 ##                 ####    ####  ######
                 ###                ##        ##      ## 
             #######                ##        ##       # 
             #######                 ##      ##       ## 
             #######                  ##################
                                    ###################
       ######                       ##################
    ############                    ## 
  ################                  #
 #####        #####                        ###### 
###               ##                    ############ 
#                  #                  ################ 
#                  #                 #####        ##### 
##                ##                ###               ##
 ##              ###                #                  # 
 #####        #####                 #                  # 
   ###############                  #                 ##
     ##########                      #               ###
                                     ##             ###
                                       ##            



# Edit and Source this File
alias vip='mvim ~/.profile'
alias sp='. ~/.profile'

# Edit PYTHONPATH
alias vie='sudo vi /etc/launchd.conf'

# Aliases for MacBook Files
# alias ssht='ssh tallrice@10.0.0.6'
alias vitp='vi /Volumes/tallrice/.profile'
alias vite='sudo vi /Volumes/tallrice/../../etc/launchd.conf'

# Added to update environment variables globally without needing to reboot
alias updenv='grep -E "^setenv" /etc/launchd.conf | xargs -t -L 1 launchctl'

# Command Prompt
PS1='$PWD >> '

# TextBook Commands
alias cp_azw='cp -pR ~/Documents/My\ Kindle\ Content/*/*.azw ~/Documents/AZW/.'
alias cp_pdf='cp -vipR /Users/tallrice/Documents/Calibre\ Library/*/*/*.pdf ~/Documents/DigitalPaper/.'
# alias cp_pdf='cp -pR /Users/tallrice/Documents/reference/*/*.pdf /Users/tallrice/Google\ Drive/PDF/.'
alias cp_epub='cp -pR /Users/tallrice/Documents/reference/*/*.epub /Users/tallrice/Google\ Drive/EPUB/.'
alias cp_mobi='cp -pR /Users/tallrice/Documents/reference/*/*.mobi /Users/tallrice/Documents/MOBI/.'
# alias cp_azw='cp -pR /Users/tallrice/Documents/reference/*/*.azw* /Users/tallrice/Documents/MOBI/.'

# Show All Files
alias showall='defaults write com.apple.finder AppleShowAllFiles TRUE;killall Finder'
alias unshowall='defaults write com.apple.finder AppleShowAllFiles FALSE;killall Finder'

# Turn off / on AppNap for Python
alias pynap_off='defaults write org.python.python NSAppSleepDisabled -bool YES' # Turn OFF
alias pynap_on='defaults write org.python.python NSAppSleepDisabled -bool NO'   # Turn ON
alias vimnap_off='defaults write org.vim.MacVim NSAppSleepDisabled -bool YES' # Turn OFF
defaults write org.python.python NSAppSleepDisabled -bool YES
defaults write org.vim.MacVim NSAppSleepDisabled -bool YES

# I never use the arrow keys. If you type in 'set -o vi' in a bash shell (or put it in your .bashrc), 
# it will put the shell into "vi mode" (default is "emacs mode").
# 
# Once in vi mode, you can hit ESC to get into "command mode" and use the h, j, k, l keys as the 
# arrow keys. You can also use any of the other movement keys e.g. w, e, 0, $, etc. to navigate the 
# shell. / to search through command history. n, N to repeat searches, etc.
set -o vi

# added by Anaconda3 4.1.1 installer
# export PATH="/Users/tallrice/anaconda/bin:$PATH"
# export PATH="$PATH:/opt/local/include/boost"

# Browsersync alias
alias bs='browser-sync start --server --directory --files "**/*" &'

# Algorithms Class alias
alias jj='java-algs4'
alias jjc='javac-algs4'

# General
alias ll='ls -lt|more'
alias lc='ls -1|wc -l'
alias psme='ps -elf|grep tallrice'
alias t='ls -lt|head -12'
alias ll='ls -l'
alias la='ls -la'
alias lt='ls -lt'
alias rmr='rm -r'
alias cc='clear'
alias gc='git clone'
alias gco='git checkout'
alias gp='git push'
# conda create --name py2 python=2.7
# conda create --name py3 python=3.5
# source activate py3
# source deactivate
alias cienvs='conda info --envs'
alias sapepi='source activate epi_judge_python'
# alias sap37='source activate python37'
alias sf='source activate /Users/tallrice/anaconda3/envs/fragrancegame_p37'
alias pa='python app.py &'
alias space='dd if=/dev/zero of=~/space.space bs=100m &' # create 100Gb file to clear purgeable memory
alias sshle='ssh michaelatutterrow@cs.lewisu.edu; echo 230024174 | pbcopy'
alias pi='pip install'
alias efa1='export FLASK_APP=hello.py'
alias fdu='flask db upgrade'
alias efa2='export FLASK_APP=flasky.py'
alias fr='flask run'
alias cpwd='pwd | pbcopy'

# # updating to the latest verson of bison, installed with Homebrew
# export PATH="/usr/local/opt/bison/bin:$PATH"
# # etc...
# export PATH=$PATH:$HOME/opt/gcc-arm-none-eabi-7-2017-q4-major/bin:$HOME/opt/usr/local/bin:/usr/local/Cellar/avr-gcc/7.3.0/libexec/gcc
# export PATH="/usr/local/opt/avr-gcc@7/bin:$PATH"

# AWS EC2 VM SSH aliases
alias ssha='ssh -i mt.pem ec2-user@ec2-18-130-187-66.eu-west-2.compute.amazonaws.com'
alias sshb='ssh -i mt.pem ec2-user@ec2-35-177-104-164.eu-west-2.compute.amazonaws.com'
alias sshc='ssh -i mt.pem ec2-user@ec2-3-8-97-135.eu-west-2.compute.amazonaws.com'
alias sshd='ssh -i mt.pem ec2-user@ec2-18-130-96-241.eu-west-2.compute.amazonaws.com'
alias sshf='ssh -i mt.pem ec2-user@ec2-35-178-106-106.eu-west-2.compute.amazonaws.com'
alias sshi='ssh -i mt.pem ec2-user@ec2-35-178-249-80.eu-west-2.compute.amazonaws.com'
alias sshl='ssh -i mt.pem ec2-user@ec2-18-130-235-68.eu-west-2.compute.amazonaws.com'
alias sshm='ssh -i mt.pem ec2-user@ec2-18-130-239-115.eu-west-2.compute.amazonaws.com'
alias sshr='ssh -i mt.pem ec2-user@ec2-3-8-8-179.eu-west-2.compute.amazonaws.com'
alias ssht='ssh -i mt.pem ec2-user@ec2-35-178-181-128.eu-west-2.compute.amazonaws.com'

alias sftpa='sftp -i mt.pem ec2-user@ec2-18-130-187-66.eu-west-2.compute.amazonaws.com'
alias sftpb='sftp -i mt.pem ec2-user@ec2-35-177-104-164.eu-west-2.compute.amazonaws.com'
alias sftpc='sftp -i mt.pem ec2-user@ec2-3-8-97-135.eu-west-2.compute.amazonaws.com'
alias sftpd='sftp -i mt.pem ec2-user@ec2-18-130-96-241.eu-west-2.compute.amazonaws.com'
alias sftpf='sftp -i mt.pem ec2-user@ec2-35-178-106-106.eu-west-2.compute.amazonaws.com'
alias sftpi='sftp -i mt.pem ec2-user@ec2-35-178-249-80.eu-west-2.compute.amazonaws.com'
alias sftpl='sftp -i mt.pem ec2-user@ec2-18-130-235-68.eu-west-2.compute.amazonaws.com'
alias sftpm='sftp -i mt.pem ec2-user@ec2-18-130-239-115.eu-west-2.compute.amazonaws.com'
alias sftpr='sftp -i mt.pem ec2-user@ec2-3-8-8-179.eu-west-2.compute.amazonaws.com'
alias sftpt='sftp -i mt.pem ec2-user@ec2-35-178-181-128.eu-west-2.compute.amazonaws.com'
