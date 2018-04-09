#!/bin/bash

cd .test_files
gcc -fno-builtin main.c test.c -I .
./a.out > .tmpa
LD_PRELOAD=../libasm.so ./a.out > .tmpb
value=`diff .tmpa .tmpb`;
if [[ $value != "\n" ]]
then
    echo "The lib works.";
else
    echo "A difference has been detected.";
fi
rm -f a.out .tmpa .tmpb
cd ..
