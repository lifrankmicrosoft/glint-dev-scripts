
# central config  =====================================================
export devpath="/home/frank/dev"
alias dev="cd $devpath"

sourceallscripts main.sh configurationBackup.sh

function sourceallscripts() { 
    # `sourceallscripts` is a function that sources all `.sh` scripts in the `/home/frank/dev/scripts` directory.
    # Excluded filenames and the optional "debug" flag can be passed as arguments.
    # 
    # Usage:
    #     sourceallscripts [debug] [excluded_script1] [excluded_script2] ...
    # 
    # Arguments:
    #     debug             - (optional) If provided as the first argument, each sourcing action is printed verbosely.
    #     excluded_scriptX  - Filenames to be excluded from sourcing. You can pass any number of them.
    # 
    # How it works:
    # 1. Check for the "debug" flag and remove it from arguments if present.
    # 2. Dynamically build the `find` command, appending `-not -name` for each script to be excluded.
    # 3. Execute the `find` command to get the list of scripts to source.
    # 4. Loop through and source each script, printing messages as scripts are sourced or if any error occurs.

    # Check for debug flag
    local debug=false
    if [[ "$1" == "debug" ]]; then
        debug=true
        shift  # Remove "debug" from arguments
    fi

    # Build the find command with -not -name for each excluded script
    local find_command="find \"/home/frank/dev/scripts\" -name \"*.sh\""
    for excluded_script in "$@"; do
        find_command+=" -not -name \"$excluded_script\""
    done
    find_command+=" -print0"

    # Find all scripts and save their paths in an array
    local script_files=()
    while IFS= read -r -d '' file; do
        script_files+=("$file")
    done < <(eval "$find_command")

    # Source each script, and print a message if an error occurred
    for file in "${script_files[@]}"; do
        echo "Sourcing file: $file"  # This line is moved outside the debug check

        if $debug; then
            set -x
        fi

        if ! source "$file"; then
            echo "Failed to source ${file}"
        fi

        if $debug; then
            set +x
        fi
    done

    echo "Sourced all .sh files"
}

