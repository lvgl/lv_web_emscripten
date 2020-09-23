#!/bin/bash
git ls-tree -r HEAD | grep commit | sed 's/\t/ /g' | cut -d " " -f 3- | while read -r line; do echo -n "$line "; done; echo
