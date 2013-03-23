fs = require 'fs'
{spawn} = require 'child_process'


task 'link', '生成public和views软连接', ->
  fs.exists './compiled/public', (exists) ->
    if exists
      console.log('Public is exists')
    else
      fs.symlinkSync('../public', './compiled/public', 'dir')
      console.log('Public link is created')

  fs.exists './compiled/views', (exists) ->
    if exists
      console.log('Views is exists')
    else
      fs.symlinkSync('../views', './compiled/views', 'dir')
      console.log('Views link is created')


task 'compile', '编译并运行测试', ->
  spawn 'jitter', ['.', 'compiled', 'test']