# code to create a mock directory framework to test file-samplr before using it on important data

for pond in {1..9}; do # make the set of ponds
    for year in {2000..2025}; do # make the set of years
        for month in {1..12}; do # make set of months
        dir="pond$pond/$year/$month" # in pond - there is: pond_x, month_x, year_x
        mkdir -p "$dir" # make directory 
        for i in {1..5}; do  # in the last directory, make 50 files 
            touch "$dir/dir$i_file$i.txt"
            done
        done
    done
done 
