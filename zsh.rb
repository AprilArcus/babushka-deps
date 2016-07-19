dep 'zsh.managed'

dep 'zsh - system shell' do
  requires 'zsh.managed'
  met? { File.readlines('/etc/shells').include? "#{which 'zsh'}\n" }
  meet { sudo "echo `which zsh` >> /etc/shells" }
end

dep 'zsh - user shell' do
  requires 'zsh - system shell'
  met? { shell "finger -m `whoami` | grep zsh" }
  meet { shell "chsh -s '#{which 'zsh'}' #{ENV['USER']}" }
end

dep 'zsh - oh-my-zsh' do
  met? { ('~' / '.oh-my-zsh').directory? }
  meet { git 'git@github.com:robbyrussell/oh-my-zsh.git', to: '~/.oh-my-zsh' }
end

# dep 'zsh - powerlevel9k', template: 'zsh_theme' do
#   user 'bhilburn'
#   repo 'powerlevel9k'
# end

dep 'zsh - iterm2 integration' do
  met? { ('~' / '.iterm2_shell_integration.zsh').exist? }
  meet { shell "curl -L https://iterm2.com/misc/zsh_startup.in >> ~/.iterm2_shell_integration.zsh" }
end

dep 'zshrc.dotfile'

dep 'zsh' do
  requires 'zsh.managed'
  requires 'zsh - system shell'
  requires 'zsh - user shell'
  requires 'zsh - oh-my-zsh'
  # requires 'zsh - powerlevel9k'
  requires 'powerline-status.pip'
  requires 'zsh - iterm2 integration'
  requires 'zshrc.dotfile'
end