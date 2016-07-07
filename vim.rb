dep 'vim.managed'

# Pathogen, a package manager for vim
# https://github.com/tpope/vim-pathogen

dep 'vim - pathogen', template: 'pathogen' do
  repo 'git@github.com:tpope/vim-pathogen.git'
end

# Fixes for iTerm2 and tmux
# https://github.com/sjl/vitality.vim

dep 'vim - vitality', template: 'pathogen' do
  repo 'git@github.com:sjl/vitality.vim.git'
end

# Solarized color scheme
# https://github.com/altercation/vim-colors-solarized

dep 'vim - solarized', template: 'pathogen' do
  repo 'git@github.com:altercation/vim-colors-solarized.git'
end

dep 'vimrc.dotfile'

dep 'vim' do
  # requires 'vim.managed'
  requires 'vim - pathogen'
  requires 'vim - solarized'
  requires 'vim - vitality'
  requires 'vimrc.dotfile'
end