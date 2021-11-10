# target:dependent
#		command
#

hello: main.c
	$(CXX) -o hello main.c
	echo "OK"