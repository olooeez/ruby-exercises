#!/usr/bin/env bash

if ! command -v bundler &> /dev/null; then
    echo "Installing bundler"
    sudo gem install bundler
fi

bundle config set --local with 'development'

for project in */
do
    echo "> ${project:0:-1}"
    cd $project

    if [ -d 'spec' ]
    then
        echo "Installing dependencies for ${project:0:-1}"
        sudo bundle install --quiet
        echo "Running tests for ${project:0:-1}"
        bundle exec rspec
    else
        echo -e "\nNo test directory found in ${project:0:-1}\n"
    fi

    cd ..
done
