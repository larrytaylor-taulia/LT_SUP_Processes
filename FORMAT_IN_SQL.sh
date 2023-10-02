#!/bin/sh
#perl -p -i -e "s/^$//d" $1
#perl -p -i -e "s/',',//d" $1
#perl -pi -e "s/,//g" $1
#perl -p -i -e "s/^/'/g" $1
perl -p -i -e  "s/^(.*)$/'\$1',/" $1
##sed "s/^/'/;s/$/'/" $1

