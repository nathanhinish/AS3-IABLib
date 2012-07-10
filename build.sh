#!/bin/sh
#
# ./build.sh -d will build the Documentation (docs/index.html)
# ./build.sh -e will build the example SWF (example.swf)
# ./build.sh -s will build the SWC library (IABLib.SWC)
# ./build.sh -des will build all.


PROG_NAME=$(basename $0)

while getopts des OPTION
do
    case ${OPTION} in
        d) 
            asdoc \
                -source-path=src \
                -doc-sources=src/com/hinish/spec \
                -output=docs
            ;;
        e) 
            mxmlc examples/src/com/hinish/examples/vast/VASTExample1.as \
                --source-path+=examples/src \
                --library-path+=examples/libs \
                -static-link-runtime-shared-libraries \
                --output=examples/bin/VASTExample1.swf
            ;;
        s) 
            compc \
                --source-path+=src \
                --include-sources=src \
                --output=./bin/IABLib.swc
            ;;
    esac
done