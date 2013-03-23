{spawn} = require 'child_process'

task 'Compile', 'Re-compiles coffee sources and runs tests on change', ->
  spawn 'jitter', ['.', 'compiled', 'test']