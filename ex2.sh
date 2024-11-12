# 2a 
awk '!/^#/' data.csv | tr -d ',' > data.txt
echo "Metadata and commas removed, saved as data.txt"

# 2b 
even_count=$(awk '{for(i=1;i<=NF;i++) if($i%2==0) count++} END{print count}' data.txt)
echo "Number of even numbers: $even_count"

# 2c 
threshold=$(echo "100 * sqrt(3) / 2" | bc -l)
awk -v threshold=$threshold '{
    sum=0;
    for(i=1;i<=NF;i++) sum+=$i^2;
    dist=sqrt(sum);
    if(dist > threshold) count1++;
    else count2++;
} END {
    print "Entries with sqrt(X^2 + Y^2 + Z^2) > threshold: " count1;
    print "Entries with sqrt(X^2 + Y^2 + Z^2) <= threshold: " count2;
}' data.txt

# 2d 
read -p "Enter the number of copies to make (n): " n
for i in $(seq 1 $n); do
    awk -v divisor=$i '{for(j=1;j<=NF;j++) $j=$j/divisor} 1' data.txt > "data_copy_$i.txt"
    echo "Created data_copy_$i.txt with values divided by $i"
done