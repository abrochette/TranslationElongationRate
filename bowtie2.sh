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

reference_index="bowtie_index/bowtie_ref"
# specifying path for output files, and string to put at end of each output file name
output_dir="bowtie2_output"
output_str="bowtie2"
# specifying path to input files
input_dir="cutadapt_output"

# loop through each line in the input file
while IFS= read -r line; do
      line=$(echo "$line" | sed -e 's/^[ \t]*//' -e 's/[ \t]*$//')

    # cutadapt command with 3' adapter seq for riboseq data (replace with seq to cut)
    # -j 4 tells this process to run using 4 cores

      bowtie2 --norc -x "${reference_index}" -U "${input_dir}/${line}" -S "${output_dir}/${output_str}_${line}.sam"
done < "$input_file"

# run chmod +x filepath/bowtie2.sh
# then run sh filepath/bowtie2.sh filepath/txt_file.txt
  # make sure to include txt file as parameter, and specify paths as necessary

