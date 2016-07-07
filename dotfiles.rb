dep 'dotfiles' do
  met? do
   ('~' / '.dotfiles').directory?
  end
  meet do
    git 'git@github.com:AprilArcus/dotfiles.git', to: '~/.dotfiles'
  end
end
