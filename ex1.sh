# 1a
cd $HOME
mkdir students 
wget -O "students.csv" "https://www.dropbox.com/scl/fi/bxv17nrbrl83vw6qrkiu9/LCP_22-23_students.csv?rlkey=47fakvatrtif3q3qw4q97p5b7&e=1"
cp "students.csv" ./students

# 1b
cd $HOME
cd students
grep "PoD" students.csv > PoD.csv
grep "Physics" students.csv > Physics.csv

# 1c
cd $HOME
cd students
cat "students.csv" | cut -d "," -f1 | cut -c1 | sed "1d" | sort | uniq -c > counter.csv
# cut -d "," -f1 delete all the column but the first one
# cut -c1 delete the first character
# sed "1d" delete the first row

# 1d
tmp = 0
for i in $(cat "counter.csv")
do
    # Do something with each line, e.g., print it
    if [$i -gt $i+1]; then
        $tmp = $i
    fi

    echo "$tmp"
done

#1e
cd $HOME
cd students
