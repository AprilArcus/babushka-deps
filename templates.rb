meta :dotfile do
  template do
    origin = '.dotfiles' / basename
    destination = '~' / ".#{basename}"
    requires 'dotfiles'
    met? do
      destination.symlink? && destination.readlink == origin
    end
    meet do
      unmeetable! "#{origin} does not exist" if not origin.exist?
      destination.rename "#{destination.basename}~" if destination.exist?
      destination.make_symlink origin
    end
  end
end

# for installing git repo style plugins
# template_name      install_path            requirements
{ zsh_theme:  ['~/.oh-my-zsh/themes', ['zsh - oh-my-zsh']],
  pathogen:         ['~/.vim/bundle']
}.each do |template_name, (install_path, requirements)|
  meta template_name do
    accepts_value_for :repo
    template do
      requirements.each { |requirement| requires requirement } if requirements
      path = lambda do |repo|
        install_path / File.basename(repo).chomp('.git')
      end
      met? { path.call(repo).directory? }
      meet { git repo, to: path.call(repo) }
    end
  end  
end

meta :plist do
  accepts_value_for :file
  accepts_value_for :key
  accepts_value_for :want
  accepts_value_for :write
  template do
    met? { shell("defaults read #{file} #{key}") == want }
    meet { shell "defaults write #{file} #{write}", sudo: file[0] == '/' }
  end
end
