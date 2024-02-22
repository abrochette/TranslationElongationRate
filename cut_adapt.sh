#!/bin/bash

# reading input txt file with names of every file to run
# make sure to either specify path or be in correct directory when running this script

# check if input file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file="$1"

# check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found."
    exit 1
fi

# specifying path for output files, and string to put at end of each output file name
output_dir="cutadapt_output"
output_str="cutadapt"
# specifying path to input files
input_dir="fastq_files"

# loop through each line in the input file
while IFS= read -r line; do
      line=$(echo "$line" | sed -e 's/^[ \t]*//' -e 's/[ \t]*$//')

    # cutadapt command with 3' adapter seq for riboseq data (replace with seq to cut)
    # -j 4 tells this process to run using 4 cores

    cutadapt -j 4 -a AGATCGGAAGAGCACACGTCT "${input_dir}/${line}" -o "${output_dir}/${line}_${output_str}"
    # $line is input file name
done < "$input_file"

# run chmod +x cutadapt/cut_adapt.sh
# then run sh cutadapt/cut_adapt.sh cutadapt/cutadapt_riboseq.txt
  # make sure to include txt file as parameter, and specify paths as necessary

