#!/bin/bash

function merging_stage()
{
    echo "merging_stage"
    git branch -a

    if ! currentBranch=$(git symbolic-ref -q HEAD)
    then
        echo "We are not currently on a branch!"
        echo 
        echo "Attempting to checkout integration branch!"
        git checkout -b integration origin/integration
    else
        echo "We are currently on branch: ${currentBranch}"
    fi

    git merge origin/master

    echo $?
}

function building_stage()
{
    echo "building_stage"
}

function testing_stage()
{
    echo "testing_stage"
}

function deployment_stage()
{
    echo "deployment_stage"
}

#check what stage we are on

stages=("merging_stage" "building_stage" "testing_stage" "deployment_stage")

if [ $1 = ${stages[0]} ]
then
    merging_stage
elif [ $1 = ${stages[1]} ]
then
    building_stage
elif [ $1 = ${stages[2]} ]
then
    testing_stage
elif [ $1 = ${stages[3]} ]
then
    deployment_stage
else
    echo "That stage: $1 is not defined"
    exit 1
fi

echo "Lets see if this worked!"