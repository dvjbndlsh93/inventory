#!/bin/bash
fullname=$1
file_ext=${fullname##*.}
length=$(($#0))
arguments=${@:2:length}
if [ $file_ext = "py" ]; then
  python $fullname $arguments
elif [ $file_ext = "cpp" ] || [ $file_ext = "cc" ]; then
  cpp_executable_ext='.out'
  output_file=${fullname%.*}
  g++ -o $output_file$cpp_executable_ext $fullname
  ./$output_file$cpp_executable_ext $arguments
elif [ $file_ext = "js" ]; then
  node $fullname $arguments
fi
