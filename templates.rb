# for installing git repo style plugins
# template_name  install_path            requirements
{
  # zsh_theme:    ['~/.oh-my-zsh/themes', ['zsh - oh-my-zsh']],
  pathogen:     ['~/.vim/bundle']
}.each do |template_name, (install_path, requirements)|
  meta template_name do
    accepts_value_for :user
    accepts_value_for :repo
    template do
      requirements.each { |requirement| requires requirement } if requirements
      met? { (install_path / repo).directory? }
      meet do
        git "git@github.com:#{user}/#{repo}.git", to: (install_path / repo)
      end
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
