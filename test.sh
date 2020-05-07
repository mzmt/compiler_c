#!/bin/bash
assert() {
  expected="$1"
  input="$2"

  ./cc "$input" > cc.s
  cc -o tmp cc.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

assert 0 0
assert 42 42
assert 22 "5+21-4"
assert 41 "5 + 44 - 8"

echo OK
