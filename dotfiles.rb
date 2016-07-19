# TODO - use or set $XDG_CONFIG_HOME

dep 'dotfiles' do
  met? do
   ('~' / '.config').directory?
  end
  meet do
    git 'git@github.com:AprilArcus/dotfiles.git', to: '~/.config'
  end
end

meta :dotfile do
  template do
    origin = '~' / '.config' / basename
    destination = '~' / ".#{basename}"
    requires 'dotfiles'
    met? do
      destination.symlink? && destination.readlink == origin
    end
    meet do
      unmeetable! "#{origin} does not exist" if not origin.exist?
      destination.rename "#{destination.basename}~" if destination.exist? || destination.symlink?
      destination.make_symlink origin
    end
  end
end