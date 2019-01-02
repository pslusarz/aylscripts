#!/bin/bash
# Generate barebones groovy/gradle project
# Author: Pawel Slusarz @pslusarz
# License: MIT
if [ -n "$1" ]
then
  project_name=$1
else  
  project_name="new-project" # Default, if not specified on command-line.
fi 
language="groovy"

mkdir -p "$project_name/src/main/$language/org/sw7d"
mkdir -p "$project_name/src/test/$language/org/sw7d"

main_file="$project_name/src/main/$language/org/sw7d/Main.$language"
echo "package org.sw7d" >> $main_file
echo "class Main {" >> $main_file
echo "  static void main(args) {" >> $main_file
echo "    println 'hello barebones groovy'" >> $main_file
echo "  }" >> $main_file
echo "}" >> $main_file

build_file="$project_name/build.gradle"
echo "apply plugin: '$language'" >> $build_file
echo "apply plugin: 'idea'" >> $build_file
echo "apply plugin: 'eclipse'" >> $build_file
echo "apply plugin: 'application'" >> $build_file
echo "" >> $build_file
echo "mainClassName = 'org.sw7d.Main'" >> $build_file
echo "" >> $build_file
echo "repositories {" >> $build_file
echo "  mavenCentral()" >> $build_file
echo "}" >> $build_file
echo "" >> $build_file
echo "dependencies {" >> $build_file
echo "  compile 'org.codehaus.groovy:groovy-all:2.4.11'" >> $build_file
echo "}" >> $build_file
echo "task wrapper(type: Wrapper) {" >> $build_file
echo "  gradleVersion = '4.0.1'" >> $build_file
echo "}" >> $build_file

gitignore_file="$project_name/.gitignore"
echo ".gradle/" >> $gitignore_file
echo "build/" >> $gitignore_file
#idea project files
echo "*.iml" >> $gitignore_file
echo "*.ipr" >> $gitignore_file
echo "*.iws" >> $gitignore_file
echo ".idea/" >> $gitignore_file
echo "classes/" >> $gitignore_file
#eclipse project files
echo ".settings/" >> $gitignore_file
echo ".classpath" >> $gitignore_file
echo ".project" >> $gitignore_file
