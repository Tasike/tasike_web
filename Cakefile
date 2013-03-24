exec = require('child_process').exec
spawn = require('child_process').spawn

task('compile', '编译Coffee为JavaScript', ->
  spawn('jitter', ['.', '.'])
)

task('test', '进行单元测试', ->
  exec('jasmine-node --coffee tests/', (error, stdout, stderr) ->
    console.log(stdout)
  )
)