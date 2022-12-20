#!/bin/bash

# Check if an input file was provided
if [ $# -eq 0 ]; then
  echo "Error: No input file provided."
  exit 1
fi
# Set the input file
input_file=$1

# Set the output file
# Note this will save to your Desktop; you may want to put the file in a different location
output_file=~/Desktop/embedded-links.csv

# Initialize the CSV file with a header row
echo "embed_link" > $output_file

# Search for embedded links in the input file
embed_links=$(grep -o '\[embed\].*\[/embed\]' $input_file | sed 's/\[embed\]\(.*\)\[\/embed\]/\1/')

# Add the embedded links to the CSV file
for embed_link in $embed_links; do
  # Append the embedded link to the CSV file
  echo $embed_link >> $output_file
done
