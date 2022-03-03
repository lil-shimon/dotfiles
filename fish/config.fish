# ~/.config/fish/config.fish

## >>> flutter config #########################################################
#
# flutter configs
#
###############################################################################

# flutter path
set -x PATH ~/Develop/flutter/bin $PATH

set -x PATH ~/Qt/5.15.2/clang_64/bin/:$PATH
## <<< flutter config #########################################################
#
###############################################################################


## >>> nodebrew config ########################################################
#
# nodebrew configs
#
###############################################################################

# nodebrew path
set -x PATH $HOME/.nodebrew/current/bin $PATH

## <<< nodebrew config ########################################################
#
###############################################################################



## >>> rust config ############################################################
#
# rust configs
#
###############################################################################

# rust path
set PATH ~/.cargo/bin $PATH

# lvim path
set PATH ~/.local/bin/lvim $PATH

## <<< rust config ############################################################
#
###############################################################################


## >>> neovide config #########################################################
#
# neovide configs
# I do not use neovide much
#
###############################################################################

#neovide path
set -x PATH ~/neovide/target/release/neovide $PATH
set -x PATH ~/neovide/target/release/neovide/ $PATH
set -x PATH ./target/release/neovide/ $PATH
set -x PATH ~/neovide/ $PATH

# neovide settings
function nv
	neovide $argv[1] && alacritty & 
end

alias nvm="nv"

## <<< neovide config #########################################################
#
###############################################################################


## >>> fish config ############################################################
#
# related fish shell
#
###############################################################################

# peco 
# set fish_plugins theme peco
# function fish_user_key_bindings
#   bind \cr 'peco_select_history  (commandline -b)'
# end

# for fisher plugin fzf
#set -U FZF_LEGACY_KEYBINDINGS 0

# set color on ls command
# set -x LSCOLORS gxfxcxdxbxegedabagacad

# fish alias
# alias vi='nvim'
alias vi='nvim'
alias someapi='cd ~/project/someone-api'
alias somefront='cd ~/project/someone-front'
alias ide='sh ~/ide.sh'
alias ad='git add .'
alias cmt='git cz; and git push origin HEAD'
alias poh='git push origin HEAD'
alias sts='git status'
alias dif='git diff'
alias addgitremote="sh ~/shellscript/add-git-remote.sh"
alias push='bash ~/shellscript/cz.sh'
alias dev='sh ~/shellscript/dev.sh'
alias signageRelease='sh ~/shellscript/signageReleash.sh'
alias ordermanagement='sh ~/shellscript/ordermanagement.sh'
alias orderdev="sh ~/shellscript/devordermanagement.sh"
alias shcom='cd ~/shellscript'
alias fishconf="sh ~/shellscript/pathtofishconfig.sh"
alias naviconf="sh ~/shellscript/navicheat.sh"
alias alacrittyconfig='sh ~/shellscript/pathtoalacrittyconfig.sh'
alias dp='docker ps'
alias ds='docker stop'
alias dr='docker run'
alias up='docker-compose up -d'
alias st='docker-compose stop'
alias logs='docker-compose logs'
alias rst='docker-compose restart'
alias sgnin='docker exec -it local-php-fpm bash'
alias sgnstart='sh ~/shellscript/startsignage.sh'
alias sgn='cd ~/questar/cloud-sign.com'
alias sgnreact='cd ~/questar/cloud-sign-react'
alias sgndoc='cd ~/questar/cloud-sign.com/docker-compose/local'
alias pw='cd ~/questar/power_control/'
alias pwdoc='cd ~/questar/power_control/docker-compose/power-control-local'
alias pwfront='sh ~/questar/power_control/script/local-debug.sh startFrontend'
alias pwsocket='sh ~/questar/power_control/script/local-debug.sh startWebSocketServer'
alias pwstorybook='bash ~/shellscript/power-controller-storybook.sh'
alias mmz="cd ~/questar/mamozn.com"
alias bmmz="cd ~/questar/back.mamozon.com"
alias smmz="cd ~/questar/sign.mamozon.com"
alias ssmmz="cd ~/questar/signs.mamozon.com"
alias nvimconf='cd ~/.config/nvim; and nvim'
alias la='ls -a'
alias sgnl="open -a '/Applications/Google Chrome.app' http://test1.example.com"
alias dbsgnl="open -a '/Applications/Google Chrome.app' http://test1.example.com:8080"
alias regwkr="open -a '/Applications/Google Chrome.app' https://test1.example.com/register_worker/1"
alias material="open -a '/Applications/Google Chrome.app' https://material-ui.com/getting-started/installation/"
alias gl="open -a '/Applications/Google Chrome.app' https://gitlab.com/"
alias wtc="npm run watch"
alias 1dev="open -a '/Applications/Google Chrome.app' https://1.dev.cloud-sign.com"
alias 2dev="open -a '/Applications/Google Chrome.app' https://2.dev.cloud-sign.com"
alias 3dev="open -a '/Applications/Google Chrome.app' https://3.dev.cloud-sign.com"
alias 4dev="open -a '/Applications/Google Chrome.app' https://4.dev.cloud-sign.com"
alias 5dev="open -a '/Applications/Google Chrome.app' https://5.dev.cloud-sign.com"
alias 6dev="open -a '/Applications/Google Chrome.app' https://6.dev.cloud-sign.com"
alias 7dev="open -a '/Applications/Google Chrome.app' https://7.dev.cloud-sign.com"
alias 8dev="open -a '/Applications/Google Chrome.app' https://8.dev.cloud-sign.com"
alias ne="open -a '/Applications/Neovide.app'"
alias vs='open -a /Applications/Visual Studio Code.app'
alias ws='open -a /Applications/WebStorm.app'
alias phps='open -a /Applications/PhpStorm.app'
alias ppt='open -a /Applications/Microsoft PowerPoint.app'
alias doc-app='open -a /Applications/Docker.app'
alias teams='open -a /Applications/Microsoft Teams.app'
alias vers='sw_vers'
alias neo='neofetch'
alias master='git checkout master'
alias pullm='git pull origin master'
alias ..='cd ..'
alias ...='cd ../..'
alias x='exit'
alias v='tmux split-window -h -p 50'
alias watch='npm run watch'
alias poll="npm run watch-poll"
alias c="neovide/target/release/; and cargo run --release"
alias nvom="cd ~/neovide"
alias process="ssh questar@processing.cloud-sign.com"
alias ta="cd questar/touchanalyzer"
alias cl="clear"
alias cc="clear"
alias l="exa -abghHliS"
alias ll="exa -abghHliS"
alias starship="cd ~/.config; and nvim starship.toml"
alias d="cd"
alias fr='flutter run'
alias apply='source ~/.config/fish/config.fish'
alias lls="cd ~/ssh; and ssh -i lil_shimon.pem ec2-user@ec2-13-115-33-8.ap-northeast-1.compute.amazonaws.com"
alias b="bat"
alias fishcolorconf="fish_config"
alias termcolor="alacritty-themes"
alias symcheck=" exa -abghHliS | rg "
alias globalquestar="ssh questar@questar.cloud-sign.com"
alias questarRouter="questar@192.168.0.5"
alias p="pwd"
alias samBTC="cd ~/development/aws-bitcoin; and sam local invoke PurchaseBTCFunction"
alias vimtutor="nvim +Tutor"
alias lunarSync="bash ~/shellscript/syncLvim.sh"
alias cleanDesktop="cd ~/utils/file-cleaner; and bash test.sh"
alias prod-test="bash ~/shellscript/prod-react-test.sh"

### >>> bobthefish config #########################################################
##
## bob the fish (fish prompt plugin)
##
###################################################################################
#set -g theme_display_git no
#set -g theme_display_git_dirty no
#set -g theme_display_git_untracked no
#set -g theme_display_git_ahead_verbose yes
#set -g theme_display_git_dirty_verbose yes
#set -g theme_display_git_stashed_verbose yes

## By default theme will hide/collapse the branch name in your prompt when you are using a Git default branch 
## i.e. historically master and often main now. 
## Set to yes to stop these branches from being hidden/collapsed.
#set -g theme_display_git_default_branch yes

## The big cloud repos (GitHub, Bitbucket, GitLab et al.) are moving away from using master as the default branch name, 
## and allow you to choose your own. 
## As of version 2.28, Git also supports custom default branch names via the init.defaultBranch config option. 
## If our defaults of master main don't suit you, you can add/remove names in thist list 
## i.e. main trunk. 
## This ensures correct hiding/collapsing behaviour with custom default branch names (unless option above is activated).
#set -g theme_git_default_branches master main

#set -g theme_git_worktree_support yes
#set -g theme_use_abbreviated_branch_name yes
#set -g theme_display_vagrant yes
#set -g theme_display_docker_machine no
#set -g theme_display_k8s_context yes
#set -g theme_display_hg yes
#set -g theme_display_virtualenv no
#set -g theme_display_nix no
#set -g theme_display_ruby no
#set -g theme_display_node yes
#set -g theme_display_user ssh
#set -g theme_display_hostname ssh

## By default the vi mode indicator will be shown if vi or hybrid key bindings are enabled. 
## Use no to hide the indicator, or yes to show the indicator.
#set -g theme_display_vi no
#set -g theme_display_date no
#set -g theme_display_cmd_duration yes
#set -g theme_title_display_process yes
#set -g theme_title_display_path no
#set -g theme_title_display_user yes
#set -g theme_title_use_abbreviated_path no
#set -g theme_date_format "+%a %H:%M"
#set -g theme_date_timezone America/Los_Angeles
#set -g theme_avoid_ambiguous_glyphs yes
#set -g theme_powerline_fonts yes
#set -g theme_nerd_fonts yes
#set -g theme_show_exit_status yes
#set -g theme_display_jobs_verbose yes
#set -g default_user your_normal_user
#set -g theme_color_scheme dark
#set -g fish_prompt_pwd_dir_length 0
#set -g theme_project_dir_length 1
#set -g theme_newline_cursor yes
#set -g theme_newline_prompt '$ '

## <<< bobthefish config #########################################################
# bob the fish (fish prompt plugin)
##################################################################################

## <<< fish config #########################################################
#
###############################################################################


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/shimozawakenta/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

## >>> starship config ############################################################
#
# 初期化のためのスクリプトを追加
#starship init fish | source
export STARSHIP_CONFIG=~/.starship/config.toml
###############################################################################
