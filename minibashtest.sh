#!/bin/bash

# no uninitialised variables
set -o nounset

# colors
GREEN="\x1B[32m"
RED="\x1B[31m"
RESET="\x1B[0m"

# function to run all the tests defined in here and report about the findings
function run_test_suite {
  ASSERTIONS=0
  FAILURES=0
  SUCCESSES=0
  TEST_CASES=0

  for testcase in $(declare -f | grep -o "^test[a-zA-Z_]*") ; do
    type setup 2>&1 | grep -q function && setup
    ${testcase}
    type tear_down 2>&1 | grep -q function && tear_down
    TEST_CASES=$((TEST_CASES+1))
  done

  warn "\nTest Result:\n${TEST_CASES} test cases with ${ASSERTIONS} assertions ran.\n"
  if [[ ${FAILURES} -eq 0 ]]; then
    warn "All tests passed.\n"
    exit 0
  else
    warn "There were ${GREEN}${SUCCESSES}${RESET} successes"
    warn " and ${RED}${FAILURES}${RESET} assertion failures.\n"
    exit 1
  fi

}

# helper function to print something to stderr
function warn {
  >&2 echo -ne "${1:-"Unknown Error"}"
}

# basic assertion function. Takes a command that needs to exit with 0 for
# success and a string to print out if it exited with another code.
#
# Parameters:
# $1 - command to execute
# $2 - string to print for error
#
function assert {
  eval "$1"
  if [[ $? != 0 ]]; then
    warn "${FUNCNAME[1]}: ${RED}FAIL${RESET}: ${2}: ${1}\n"
    FAILURES=$((FAILURES+1))
  else
    SUCCESSES=$((SUCCESSES+1))
    warn "${FUNCNAME[1]}: ${GREEN}OK${RESET}\n"
  fi
  ASSERTIONS=$((ASSERTIONS+1))
}
