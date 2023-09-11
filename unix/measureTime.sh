function measuretime() {
    local start end duration_minutes duration_seconds total_seconds log_file

    start=$(date +%s)  # Get the start time in seconds since the Unix epoch.

    echo "Running function: $1"  # Echoes the name of the function being run.

    echo "About to run function: $1"
    
    # Capture errors and cancellations
    if ! "$@"; then
        echo "Error occurred or operation was cancelled. Not logging total build time."
        return 1
    fi
    
    echo "Finished running function: $1"

    end=$(date +%s)  # Get the end time in seconds since the Unix epoch.
    total_seconds=$((end - start))

    duration_minutes=$((total_seconds / 60))
    duration_seconds=$((total_seconds % 60))

    log_msg="Execution time for $1: $duration_minutes minutes $duration_seconds seconds"
    echo $log_msg

    log_file=~/buildTime.txt

    # Check if ~/buildTime.txt exists, and append or create and append as necessary.
    if [[ -f $log_file ]]; then
        echo $log_msg >> $log_file
    else
        touch $log_file
        echo $log_msg >> $log_file
    fi
}


function allbuildtimes(){
    code ~/buildTime.txt;
}

function avgbuildtimes() {
    local log_file="$HOME/buildTime.txt"
    declare -A func_count func_min func_sec

    while IFS=":" read -r func time; do
        # Remove any leading and trailing spaces.
        func=$(echo "$func" | sed 's/.*for \(.*\)$/\1/')
        mins=$(echo "$time" | cut -d ' ' -f 2)
        secs=$(echo "$time" | cut -d ' ' -f 4)

        # Accumulate function times.
        func_min["$func"]=$(( func_min["$func"] + mins ))
        func_sec["$func"]=$(( func_sec["$func"] + secs ))

        # Increase function occurrence count.
        func_count["$func"]=$(( func_count["$func"] + 1 ))
    done < "$log_file"

    for func in "${!func_count[@]}"; do
        avg_min=$(( func_min["$func"] / func_count["$func"] ))
        avg_sec=$(( func_sec["$func"] / func_count["$func"] ))

        # Adjust averages if seconds exceed 60.
        while [ "$avg_sec" -ge 60 ]; do
            avg_sec=$(( avg_sec - 60 ))
            avg_min=$(( avg_min + 1 ))
        done

        echo "Average time for $func: $avg_min minutes $avg_sec seconds"
    done
}


function measureallbuilds(){
    sudo echo "starting"; bebuild;  uirmnodemodules; uimtinstall; uimtbuild; uimttest; uicoretest; uilint; uitestall; avgbuildtimes
}

function avgmeasureallbuilds() {
    local count=20

    for i in $(seq 1 $count); do
        echo "Run $i of $count..."
        measureallbuilds
    done
    avgbuildtimes
}