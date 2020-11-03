#!/bin/bash
set -e
export PATH=/llvm/bin:$PATH

function validate {
  $1 > perf_out
  echo
  echo $1
  grep "Result" perf_out;grep "PASSED" perf_out
  rc=$?; if [[ $rc != 0 ]]; then echo "TEST FAILED *****";exit $rc; fi;rm perf_out
}

cd code/tests/$1
/code/mccomp $1.c
clang++ driver.cpp output.ll -o $1
validate "./$1"
