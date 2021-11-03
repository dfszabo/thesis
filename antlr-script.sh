#!/bin/bash

export CLASSPATH=".:/home/david/Downloads/antlr-4.9.2-complete.jar:$CLASSPATH"
antlr4='java -jar /home/david/Downloads/antlr-4.9.2-complete.jar'
grun='java org.antlr.v4.gui.TestRig'

# assuming that antlr-files directory exists
cd antlr-files
rm *
cp ../miniC.g4 miniC.g4

# create the parser with antlr and compile it
$antlr4 miniC.g4
javac miniC*.java

for i in $(ls ..); do
  # if not .c file, then skip it
  if ! [[ $i =~ .*\.c ]];
  then
    continue
  fi

  echo "grun miniC compilationUnit ../${i}"
  $grun miniC compilationUnit ../$i
done
