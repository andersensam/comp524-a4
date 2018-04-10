.PHONY : clean debug classroom
# we're running the interpreter, not compiler
all:
	ghci -i src/assign4.hs


# push to classroom. $USER is your cs username
classroom:
	scp -r * $(USER)@classroom.cs.unc.edu:/afs/cs.unc.edu/proj/courses/comp524-s18/students/$(USER)/ASSIGN4
