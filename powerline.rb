# dep 'automake.managed'
dep 'automake.managed'
dep 'libtool.managed'

dep 'pyuv.pip'  do
	requires 'automake.managed'
	requires 'libtool.managed'
end


dep 'powerline-status.pip'  do
	requires 'pyuv.pip'
end