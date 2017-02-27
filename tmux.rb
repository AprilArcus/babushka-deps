dep 'tmux.managed'

dep 'tmux.conf.dotfile'

dep 'tmux' do
  requires 'tmux.managed'
  requires 'terminfo - tmux exists'
  requires 'powerline-status.pip'
  requires 'tmux.conf.dotfile'
end
