#! /usr/bin/env bash

# Exit in case of error
set -e

# Run this from the root of the project to generate a dev-link project
# It will contain a link to each of the files of the generator, except for
# This allows developing with a live stack while keeping the same source code
# Without having to generate dev-fsfp and integrating back all the files

rm -rf dev-link

cookiecutter --no-input -f ./ project_name="Dev Link"

mv ./dev-link/.env ./tmp-dev-link/

rm -rf ./dev-link/
mkdir -p ./dev-link/

cd ./dev-link/

for f in ../\{\{cookiecutter.project_slug\}\}/* ; do
    ln -s "$f" ./
done

cd ..

mv ./tmp-dev-link/.env ./dev-link/

rm -rf ./tmp-dev-link
