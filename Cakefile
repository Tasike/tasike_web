fs = require('fs')
exec = require('child_process').exec
spawn = require('child_process').spawn


task('link', '生成public和views软连接', ->
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
)


task('compile', '编译Coffee为JavaScript', ->
  spawn('jitter', ['.', 'compiled'])
)


task('test', '进行单元测试', ->
  exec('jasmine-node compiled/tests/', (error, stdout, stderr) ->
    console.log(stdout)
  )
)