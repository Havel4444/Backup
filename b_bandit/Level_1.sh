#!/bin/bash

## M0:
function p0() {
    cat ./-
}
## M1:
function p1() {
    cat $(pwd)/-
}
## M2:
function p2() {
    find . -name "-" -exec cat {} \;
}
