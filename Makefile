#
# 这里CC 和 CXX 指定了使用C和C++编译器
# := 用于给变量赋值，除此之外还有=、？=、+=等不同的赋值方式
# 一般全大写变量用来表示允许调用make的时候传入的变量
# 全小写变量表示仅仅内部使用的变量

CC := clang
CXX := g++

#
# Makefile中的核心概念是target,定义target的基本格式是(每一行command 必须使用tab缩进)
# targetname: dependencies
#	commands

# 要构建某个target时，使用如下命令:
#
# make target_name
#
# 下面 all是一个target,它依赖另一个target: hello,
# 意味着要构建all,首先需要构建hello,而all的commands部分为空，表示构建all不需要额外的命令

# .PHONY 表示all不是一个真实会生成的文件，而是一个“伪目标”
.PHONY: all
all: hello


##
# 由于后面需要多次使用main.o 等目标文件列表，这里赋值给变量
# objects
#
objects := main.o

#
# hello 是我们最终要生成的可执行文件名，它依赖objects中的所有所有目标文件
#

#
# 它的commands部分使用CXX指定的编译器将所有目标文件链接
# 成hello可执行文件
# $@ 表示目标文件
# $^ 表示所有的依赖文件
# $< 表示第一个依赖文件
# $? 表示比目标还要新的依赖文件列表

hello: $(objects)
	$(CXX) -o $@ $(objects)


# main.o 目标文件依赖main.cpp源文件
main.o: main.cpp
	$(CXX) -c main.cpp

#
# clean 用于清楚构建生成临时文件、目标文件和可执行文件
# 和all 类似，它是一个“伪目标”


.PHONY: clean
clean:
	rm -f hello $(objects)
