dep 'vim.managed'

# Pathogen, a package manager for vim
# https://github.com/tpope/vim-pathogen

dep 'vim - pathogen', template: 'pathogen' do
  user 'tpope'
  repo 'vim-pathogen'
end

# Fixes for iTerm2 and tmux
# https://github.com/sjl/vitality.vim

dep 'vim - vitality', template: 'pathogen' do
  user 'sjl'
  repo 'vitality.vim'
end

# Solarized color scheme
# https://github.com/altercation/vim-colors-solarized

dep 'vim - solarized', template: 'pathogen' do
  user 'altercation'
  repo 'vim-colors-solarized'
end

dep 'vim - python' do
  met? { shell? 'vim --version | grep +python' }
  meet { unmeetable! }
end

dep 'vimrc.dotfile'

dep 'vim' do
  # requires 'vim.managed'
  requires 'vim - pathogen'
  requires 'vim - solarized'
  requires 'vim - vitality'
  requires 'vim - python'
  requires 'powerline-status.pip'
  requires 'vimrc.dotfile'
end
