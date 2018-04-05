.PHONY : clean debug classroom
all:
	gch assign4 src/assign4.hs

# delete non-source files
clean:
	rm -f assign4
	rm -f tests/output*.txt

# push to classroom. $USER is your cs username
classroom:
	scp -r * $(USER)@classroom.cs.unc.edu:/afs/cs.unc.edu/proj/courses/comp524-s18/students/$(USER)/ASSIGN3
