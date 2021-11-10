# target:dependent
#		command
# CXX:make 默认是系统的g++

hello: main.c
	$(CXX) -o hello main.c
	echo "OK"