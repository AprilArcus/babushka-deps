dep 'readline.managed'

dep 'inputrc.dotfile'

dep 'readline' do
  requires 'readline.managed'
  requires 'inputrc.dotfile'
end
