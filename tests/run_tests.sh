#!/usr/bin/env bash

DIRNAME="$(dirname "${0}")"

source "${DIRNAME}/../minibashtest.sh"

function test_one_is_one {
  assert "[ 1 -eq 1 ]" "failed to assert that 1 equals 1"
}

function test_one_is_not_two {
  assert "[ 1 -ne 2 ]" "failed to assert that 1 is not 2"
}

run_test_suite
