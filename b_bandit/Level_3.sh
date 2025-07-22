#!/bin/bash

## M0:
function p0() {
    find archivo/ -type f -exec cat {} \;
}
## M1:
function p1() {
    echo "asd"
}
## M2:
function p2() {
    echo "asd"
}
