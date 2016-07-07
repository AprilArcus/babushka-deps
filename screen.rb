# TODO: install a better version of screen if we are on OS X
# dep 'screen.managed'

dep '.screen points to screen-256color terminfo entry', template: 'screen' do
  requires 'terminfo entry screen-256color exists'
  setting 'term screen-256color'
end

dep 'screen' do
#   requires 'screen.managed'
  requires '.screen points to screen-256color terminfo entry'
end
