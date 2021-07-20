#!/bin/bash
git checkout main
git pull
git checkout devel
git merge main
git push
