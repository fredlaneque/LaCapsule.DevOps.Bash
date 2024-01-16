# Filename
input_file="results.txt"

# Check if file exist
if [ ! -f "$input_file" ]; then
    echo "File $input_file  does not exist."
    exit 1
fi

# Initiate all variables
total=0
count=0

# Read each line one by one
while read -r line; do
    # Extract 2nd column
    score=$(echo $line | awk '{print $2}')
    # Add score to total
    total=$((total + score))
    # Increment count
    count=$((count + 1))
done < "$input_file"

# Calculate the average and store it in average.txt
average=$((total / count))
echo $average > average.txt
