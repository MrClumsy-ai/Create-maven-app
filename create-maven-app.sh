#!/bin/bash

name="my-app"
company="mycompany"

while getopts "hn:c:" flag; do
    case $flag in
        h)
            echo "program -n name"
            ;;
        n)
            name=$OPTARG
            ;;
        c)
            company=$OPTARG
            ;;
        \?)
            echo "invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done

echo "name = $name"
echo "company = $company"
if [ "$name" = "test" ]; then
    echo "the name cannot be 'test'"
    exit 1
fi

if [ "$company" = "test" ]; then
    echo "the name of the company cannot be 'test'"
    exit 1
fi

mvn archetype:generate -DgroupId=com.$name.app -DartifactId=$name -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.5 -DinteractiveMode=false
