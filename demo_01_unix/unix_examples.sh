##################################################
# 
# ECO 5445.0001 Intro to Business Analytics
# 
# Chapter 2: Productivity Tools
# Sample Commands in Unix
# 
# Lealand Morin, Ph.D.
# Augut 20, 2018
# 
##################################################




##################################################
# Getting your Bearings
##################################################

# Present working directory
pwd

# Manual for any unix command
man pwd

# List files
ls

# List all files
ls -a

# List them in a human-readable way
ls -lh 

# List files in a subdirectory
ls -lh Documents/
# Nothing there yet



##################################################
# Navigation
##################################################

# Move to root
# Changing directories
cd /

# See what is there
ls -a

# Look inside one of the directories
ls -a bin/

# That was scary! Let's go back home
cd ~

ls -lh


##################################################
# Creating a Directory
##################################################

# A place for this demo
mkdir Documents/demo_01_unix

# Move there
cd Documents/demo_01_unix

# See where you are now:
pwd

##################################################
# Creating a File
##################################################

# Type contents at the command line
cat > hello_world.txt
# Enter content
# Press ctrl-D to end input

# Use a text editor (more later)
# vim hello_world_1.txt


##################################################
# Examining content
##################################################

# Contents of files
cat hello_world.txt

cat hello_world_1.txt


##################################################
# Output to screen
##################################################

# Output of a command
echo "Hello World!"



##################################################
# Redirecting Output
##################################################

# Output of a command
echo "Hello World!" > hello_world_2.txt

# Take a look
cat hello_world_2.txt

# Add more content
echo "" >> hello_world_2.txt
echo "Created with echo" >> hello_world_2.txt

# Take another look
cat hello_world_2.txt


##################################################
# Examining Content
##################################################

cat > TestFile.out
# Enter content as on P&G page 18

cat TestFile.out

head TestFile.out

tail TestFile.out




##################################################
# Comparing Files
##################################################

diff hello_world.txt hello_world_1.txt

diff hello_world.txt hello_world_2.txt

diff hello_world_1.txt hello_world_2.txt



##################################################
# Creating and Deleting Directories
##################################################

mkdir dir1
echo "This ia a sample file" > dir1/sample.out

mkdir dir2

# See what you have created
ls -lh

# See what's inside
ls -lh dir1

# One is enough
rmdir dir2


# Remove them both
rmdir dir1
# Did it work?

# What about this?
rm -rf dir1



##################################################
# Moving, Coping and Deleting Files
##################################################

# Copy a single file
mkdir dir3
cp hello_world.txt dir3/

ls -lh dir3/

# Remove this file
rm dir3/hello_world.txt

ls -lh dir3/


# Copy multiple files with wildcards
cp hello_world*.* dir3/

ls -lh dir3/

# Compare with this:
mkdir dir4
cp hello_world_?.txt dir4/
ls -lh dir4/

# Move the missing file into place
mv hello_world.txt dir4/

# See what happened
ls -lh
ls -lh dir4/


##################################################
# File Protections
##################################################

chmod 400 dir4/hello_world_1.txt

ls -lh dir4/
# Notice the difference?

# Try to remove the files
rm dir4/*.*



##################################################
# Searching for Expressions
##################################################

# Was this the file created with vim?
grep 'vim' hello_world.txt

# Or was it this one?
grep 'vim' hello_world_2.txt

# It was this one for sure.
grep 'vim' hello_world_1.txt

# What id there were 100's of files to search?
# Search the current directory
grep -r 'vim' .

# Search a subdirectory
grep -r 'vim' dir4/

# Larger example
grep -r 'Hello' .


##################################################
# Sorting Files
##################################################

# Create a file of names
echo "Taylor" > Names.dat
echo "Jones" >> Names.dat
echo "Smith" >> Names.dat

# Take a look
cat Names.dat

# Now sort them and take another look
sort Names.dat > SortedNames.dat

cat SortedNames.dat


##################################################
# Cutting, Pasting and Joining Files
##################################################

echo "a b" > A.dat
echo "c d" >> A.dat
echo "e f" >> A.dat
cat A.dat

echo "1 2 3 4" > B.dat
echo "5 6 7 8" >> B.dat

# Paste them together
paste A.dat B.dat

# Output to a third file
paste A.dat B.dat > C.dat
cat C.dat

# Cut out the second and third columns, where the delimiter is a space
cut -d ' ' -f 2-3 B.dat > D.dat

cat D.dat

# Paste this to the first file
paste D.dat A.dat


##################################################
# Keyboard Control
##################################################

# First create a file that will serve as a good example
echo "n = 0" > InfiniteLoop.py
echo "while (True):" >> InfiniteLoop.py
echo "  n += 1" >> InfiniteLoop.py
echo "  print n" >> InfiniteLoop.py

# Run this and see what happens

# Pause with ctrl-S, resume with ctrl-Q, terminate with ctrl-C


##################################################
# Monitoring Processes
##################################################

top
# Press 'q' to quit top


##################################################
# Running Jobs in the Background
##################################################

nohup python InfiniteLoop.py & 

ls -lh
ls -lh
ls -lh
# See how big the file is getting?

# Stop it before it gets out of control
top
# Then press 'k' to kill a job
# Quick! Type in the pid associated with python!

# The aftermath:
ls -lh
tail nohup.out


##################################################
# Text Processing
##################################################

# Create a sample file
echo "labour" > InputFile.txt
echo "labor" >> InputFile.txt
echo "labour" >> InputFile.txt
echo "labor" >> InputFile.txt
echo "labour" >> InputFile.txt
echo "labou" >> InputFile.txt

cat InputFile.txt

# Use sed to replace instances of 'labour'
# with the American 'labor'.

sed 's/labour/labor/g' InputFile.txt > OutputFile.txt

cat OutputFile.txt



##################################################
# Shell Scripts
##################################################

# First, find the location of the bash executable
which bash

# What else is in there?
ls -lh /bin/
# Scroll up. See anything familiar?

# Code up the sample shell script sub on page 45 of P&G
# Then run an example program like the one above



##################################################
# Shortcuts and Aliases
##################################################

alias lsdir4='ls -lh ~/Documents/demo_01_unix/dir4/'
lsdir4

# This works from anywhere
cd ~
pwd
ls -lh

lsdir4

# Start creating aliases for commands you type 
# more than once a day. 
# Be careful: Don't overwrite an existing command.


##################################################
# End
##################################################
