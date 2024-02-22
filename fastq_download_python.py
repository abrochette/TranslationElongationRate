

# set variables
prefix = "SRR"
# srr number for first file
srr_number = 6880547
file_name = "name"
link = "link"
num = 7
# extension for mRNA files, which are all downloaded before RiboSeq files
extension = "_1.fastq.gz"
try:
    # open file with filenames in correct order
    with open('downloadingfastqfiles/mousesra.txt', 'r') as file:
        # read each line of the file and index different parts of the link as necessary
        for line in file:
            if num == 10:
                num = 0
            items = line.split()
            if len(items) >= 2:
                # find the file name after the first space in each line and save as a variable
                file_name = items[1] + ".fastq.gz"
            else:
                # if the line does not have at least 2 items, continue
                continue
            if file_name == "mouse26_liver_RiboSeq.fastq.gz":
                # when we reach RiboSeq data rather than mRNA data, the extension changes
                extension = ".fastq.gz"
            final_srr = prefix + str(srr_number)
            link = "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR688/00" + str(num) + "/" + final_srr + "/" + final_srr + extension
            # increment srr number with every line
            srr_number += 1
            # increment "num" part of link with every line
            num += 1
            print("fastq_files/" + file_name + " " + link)
except FileNotFoundError:
    # check if file opened correctly
    print("File not found")

