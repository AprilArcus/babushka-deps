# TODO: install a better version of screen if we are on OS X

dep 'screen.dotfile'

dep 'screen' do
  requires 'screen.dotfile'
end
