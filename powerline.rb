# dep 'automake.managed'
dep 'automake.managed'
dep 'libtool.managed'
dep 'libgit2.managed'
dep 'pygit2.pip' do
	requires 'libgit2.managed'
end

dep 'pyuv.pip'  do
	requires 'automake.managed'
	requires 'libtool.managed'
end


dep 'powerline-status.pip'  do
	requires 'pyuv.pip'
	requires 'pybgit2.pip'
end