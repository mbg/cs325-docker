#!/bin/bash
export PATH=/llvm/bin:$PATH
cd code
clang++ mccomp.cpp -g -O3 `llvm-config --cxxflags --ldflags --system-libs --libs all` -Wno-unused-function -Wno-unknown-warning-option -stdlib=libstdc++ -o mccomp