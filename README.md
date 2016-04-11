# minibashtest

[![Build Status](https://travis-ci.org/mrtazz/minibashtest.svg?branch=master)](https://travis-ci.org/mrtazz/minibashtest)
[![Packagecloud](https://img.shields.io/badge/packagecloud-available-green.svg)](https://packagecloud.io/mrtazz/minibashtest)
[![MIT license](https://img.shields.io/badge/license-MIT-blue.svg)](http://opensource.org/licenses/MIT)

## Overview
This is the most simple unit testing framework I could come up with. The
intention here is to serve as an example of how easy it can be to get started
with unit testing, even for something like bash that traditionally has less of
a unit testing culture. It's heavily inspired by [minunit][].

## Usage

```bash
#!/usr/bin/env bash

source 'minibashtest.sh'

function test_one_is_one {
  assert "[ 1 -eq 1 ]" "failed to assert that 1 equals 1"
}

function test_one_is_not_two {
  assert "[ 1 -neq 2 ]" "failed to assert that 1 is not 2"
}

run_test_suite
```

## Advanced Testing
Fortunately a lot of people have given unit testing in bash some thoughts in
the past. So if you want something more than just basic assertions, check
thosse out:

- [roundup][]
- [bats][]
- [assert.sh][]

[minunit]: http://www.jera.com/techinfo/jtns/jtn002.html
[roundup]: https://github.com/bmizerany/roundup
[assert.sh]: https://github.com/lehmannro/assert.sh
[bats]: https://github.com/sstephenson/bats
