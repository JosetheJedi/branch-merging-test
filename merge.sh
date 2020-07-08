#!/bin/bash

function merging_stage()
{
    echo "merging_stage"
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

stages=("merging_stage", "building_stage", "testing_stage", "deployment_stage")



echo ${stages[0]}