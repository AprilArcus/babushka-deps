# Disable or reduce delay after sending "escape" code
# https://www.johnhawthorn.com/2012/09/vi-escape-delays/

dep '.vimrc - disable escape delay', template: 'vimrc' do
  # "It might be more reasonable to give ttimeoutlen a more reasonable
  #  value, like 10ms, although I have encountered no issues yet."
  setting 'set timeoutlen=1000 ttimeoutlen=0'
end

dep '.zshrc - disable escape delay', template: 'zshrc' do
  setting 'KEYTIMEOUT=1'
end

dep '.tmux.conf - disable escape delay', template: 'tmux_conf' do
  setting 'set -s escape-time 0'
end

dep 'escape' do
  requires '.vimrc - disable escape delay'
  requires '.zshrc - disable escape delay'
  requires '.tmux.conf - disable escape delay'
end