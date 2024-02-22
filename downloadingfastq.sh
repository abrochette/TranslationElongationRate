#!/bin/bash

# runs python script with output specifying links to every download file and output names for each file, separated by a space on each line
output=$(python downloadingfastqfiles/fastq_download_python.py)

# loop through each line of python script output
while IFS= read -r line; do
    # get file name and URL from each line
    # these must be in separate variables for the command to work properly
    file_name=$(echo "$line" | awk '{print $1}')
    url=$(echo "$line" | awk '{print $2}')
    # print the command being executed (optional)
    echo "Downloading: $file_name from $url"
    wget -O "$file_name" "$url"
done <<< "$output"




# assuming downloadingfastqfiles is the folder with python scripts, shell scripts, and txt file with filenames
# run "chmod +x downloadingfastqfiles/downloadingfastq.sh" in terminal
# then run "chmod +x downloadingfastqfiles/fastq_download_python.py"
# then run "chmod +r downloadingfastqfiles/mousesra.txt"
# then run "sh downloadingfastqfiles/downloadingfastq.sh"


