dep 'socat.managed'

dep 'psutil.pip'

dep 'mercurial.pip'

dep 'libgit2.managed'
dep 'pygit2.pip' do
  requires 'libgit2.managed'
end

dep 'bzr.pip'

dep 'automake.managed'
dep 'libtool.managed'
dep 'pyuv.pip'  do
  requires 'automake.managed'
  requires 'libtool.managed'
end

dep 'powerline-status.pip'  do
  requires 'socat.managed'
  requires 'psutil.pip'
  requires 'mercurial.pip'
  requires 'pygit2.pip'
  requires 'bzr.pip'
  requires 'pyuv.pip'
end