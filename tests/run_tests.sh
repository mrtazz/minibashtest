#!/usr/bin/env bash

DIRNAME="$(dirname "${0}")"

source "${DIRNAME}/../minibashtest.sh"

function setup {
  FOO=0
}

function tear_down {
  FOO=0
}

function test_one_is_one {
  assert "[ 1 -eq 1 ]" "failed to assert that 1 equals 1"
}

function test_one_is_not_two {
  assert "[ 1 -ne 2 ]" "failed to assert that 1 is not 2"
}

function test_foo_is_setup {
  assert "[ ${FOO} -eq 0 ]" "failed to assert that FOO is 0"
}

function test_foo_is_set_up_and_torn_down {
  assert "[ ${FOO} -eq 0 ]" "failed to assert that FOO is 0"
  FOO=$((FOO+1))
  assert "[ ${FOO} -eq 1 ]" "failed to assert that FOO is 0"
}

run_test_suite
