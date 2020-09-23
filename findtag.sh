#!/bin/bash
git submodule status | awk '{print $1 " " $2}' | sed 's/+//g' | while read -r line; do echo -n "$line "; done; echo
