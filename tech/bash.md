# Bash

## Conditions

#### Check if a variable is empty:

```bash
if [[ -z "${foobar// }" ]]; then
fi
```

Check if a variable is not empty:

```bash
[[ -n "${foobar// }" ]]
```

Check if a string has a substring:

```bash
[[ ${str:0:1} == "/" ]]
```


#### Check if a file exists:

```bash
if [ -f $FILE ];
then
   echo "File $FILE exists."
else
   echo "File $FILE does not exist."
fi
```

#### Check if a string contains another string

```bash
string='My long string'
if [[ $string == *"My long"* ]]; then
  echo "It's there!"
fi
```

#### Check if a command exists

Definition:
```bash
  command_exists () {
      type "$1" &> /dev/null ;
  }
```

Usage:

```
  if command_exists foo ; then
      echo "yo"
  fi
```

#### Check if a string matches regex

```bash
if [[ "$date" =~ "[0-9]\{8\}" ]]; then
    echo "Valid date"
else
    echo "Invalid date"
fi
```


#### Negate if condition

```bash
if ! [[ "$date" =~ "[0-9]\{8\}" ]]; then
    echo "Invalid date"
fi
```

#### Check if a file contains given string

```bash
if grep -q SomeString "$File"; then
  Some Actions # SomeString was found
fi
```

## Loops

#### Iterate Files

```bash
for i in *; do echo $i; done
```

#### Rename bunch of files

```bash
for name in *
do
    newname=new-"$(echo "$name" | cut -c7-)" # cuts first 6 characters
    mv "$name" "$newname"
done
```

#### iterating input by line and columns

```bash
lsblk | awk '{print $1,$4}' > input.txt

while read col1 col2 ; do
  echo "$col1 $col2"
done < input.txt
```

#### While loop

```bash
COUNTER=0
while [  $COUNTER -lt 10 ]; do
  echo The counter is $COUNTER
  let COUNTER=COUNTER+1
done
```

#### Iterate a string

```bash
while read -r line; do
  swaymsg $line
done <<< "$config"
```

## String Manipulation

#### Slugify text

```bash
echo -n "hello world" | sed -e "s/[^[:alnum:]]/_/g" | tr -s "_" | tr A-Z a-z
```

#### Title-case

```bash
sed 's/.*/\L&/; s/[a-z]*/\u&/g' <<<"$1"    
```

## Dialogs

#### Opening a menu with bunch of lines

```bash
regionsArray=()

while read i name; do
  regionsArray+=($i "$name")
done <<< "$regions"

selected=$(dialog --stdout \
                  --title "Timezones" \
                  --backtitle "Happy Hacking Linux" \
                  --ok-label "Next" \
                  --no-cancel \
                  --menu "Select a continent or ocean from the menu:" \
                  20 50 30 \
                  "${regionsArray[@]}")
```

## Named Parameters

Declare all parameters starting with `-` or `--` as variable with corresponding value:

```bash
while [ $# -gt 0 ]; do
    if [[ ${1:0:2} == "--" ]]; then
        v="${1/--/}"
        declare $v="$2"
    elif [[ ${1:0:1} == "-" ]]; then
        v="${1/-/}"
        declare $v="$2"
    fi

    shift
done
```

## Background Services

Trap command allows the program to wait and receive signal from outside. Here is an example;

```bash
trap "echo bye; exit" SIGHUP SIGINT SIGTERM
trap "echo 'received sigrtmin1 signal';" SIGRTMIN+1
trap "echo 'received sigrtmin2 signal';" SIGRTMIN+2

echo "this script will endlessly loop until you stop it"
while true; do
	  sleep 1
done
```
