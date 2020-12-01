###############################################
#
# Makefile
#
###############################################

DAY ?= 0

#
# Targets
#

open:
	touch day${DAY}.swift
	open -a /Applications/CodeRunner.app day${DAY}.swift

st:
	open -a SourceTree .
