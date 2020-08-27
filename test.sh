#!/bin/fish

function help_exit
	echo "Usage:  [options] arguments..."
	echo "Arguments:"
	echo "-a : Do something"
	echo "-d : Do something else"
	echo "-c stuff : Do someting with stuff"
	exit 1
end

set args (getopt -s sh abc: $argv); or help_exit
set args (fish -c "for el in $args; echo \$el; end")

set i 1
while true
switch $args[$i]
	case "-a"
		echo "argument a is specified"
	case "-b"
		echo "argument b is specified"
	case "-c"
		set i (math "$i + 1")
		echo "value of argument c is" $args[$i]
	case "--"
		exit 1
	end
	set i (math "$i + 1")
end
set pargs
if math "$i <" (count $args) > /dev/null
	set pargs $args[(math "$i + 1")..-1]
end

echo "positional arguments:" $pargs
