function measuretime() {
    local start end duration_minutes duration_seconds total_seconds

    start=$(date +%s)  # Get the start time in seconds since the Unix epoch.
    
    echo "Running function: $1"  # Echoes the name of the function being run.
    
    "$@"  # Executes the passed function and its arguments.

    end=$(date +%s)  # Get the end time in seconds since the Unix epoch.
    total_seconds=$((end - start))
    
    duration_minutes=$((total_seconds / 60))
    duration_seconds=$((total_seconds % 60))

    echo "Execution time for $1: $duration_minutes minutes $duration_seconds seconds"
}
