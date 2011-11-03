#!/bin/sh

# version.sh
# 
# Generates src/version.sml and smackage.smackspec based on the current version
# Usage: version.sh vX.Y.Z
# gdpe, Nov 2 2011

if [ $# -ne 1 ]
then
  echo "Usage: version.sh vX.Y.Z"
  exit 1
fi


cat smackage.smackspec.in | sed "s/###VERSION###/$1/" > smackage.smackspec
echo "(* Generated by version.sml *)\n\
structure Version = \n\
struct\n\
    val version = \"$1\"\n\
end\n" > src/version.sml

echo "Generated files."
echo "Now run 'git tag v$1'"

