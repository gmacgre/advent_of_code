#/bin/bash
clear
# Make Command - ./driver.sh make <number>
command=$1
year=$2
question=$3
part=$4
args=$5
root="$year/$question"
if [ "$command" = "help" ]
then
    echo "Advent of Code Driver -- By gmacgre"
    echo "./driver.sh <command> <year> <question> <args>"
    echo "Commands:"
    echo "make      : Makes a new Folder and Default files"
    echo "transfer  : Copies the contents of <year>-<question> part 1 into <year>-<question> part 2"
    echo "run       : Runs <year>-<question> on normal input. Add 'test' arg for test input"
elif [ "$command" = "make" ]
then
    echo "Making Workspace for $year-$question..."
    mkdir "$root"
    cp base.py "$root/$question-1.py"
    cp base.py "$root/$question-2.py"
    touch "$root/test-input.txt"
    touch "$root/input.txt"
elif [ "$command" = "transfer" ]
then
    echo "Setting up $year/$question part 2..."
    cp "$root/$question-1.py" "$root/$question-2.py"
elif [ "$command" = "run" ]
then
    if [ "$args" = "test" ]
    then
        echo "Running python $root/$question-$part.py on test input...";
        python "$root/$question-$part.py" < "$root/test-input.txt"
    else
        echo "Running python $root/$question-$part.py on full input...";
        python "$root/$question-$part.py" < "$root/input.txt"
    fi
else
    echo "Command not understood"
fi