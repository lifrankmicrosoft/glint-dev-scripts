function measuretime() {
    local start end duration_minutes duration_seconds total_seconds log_file

    start=$(date +%s)  # Get the start time in seconds since the Unix epoch.
    
    echo "Running function: $1"  # Echoes the name of the function being run.
    
    "$@"  # Executes the passed function and its arguments.

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


function checkbuildtimes(){
    cat ~/.buildTime.txt;
}

function measureallbuilds(){
    bebuild; uimtinstall; uimtbuild; uimttest; uicoretest; uilint; uitestall; checkbuildtimes
}