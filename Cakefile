fs = require('fs')
exec = require('child_process').exec
spawn = require('child_process').spawn


task('link', '生成public和views软连接', ->
  fs.exists('./compiled', (exists) ->
    if exists
      console.log('compiled is exists')
    else
      fs.mkdirSync('./compiled')
      console.log('compiled is created')
  )

  fs.exists('./compiled/public', (exists) ->
    if exists
      console.log('public is exists')
    else
      fs.mkdirSync('./compiled/public')
      console.log('public is created')
  )

  fs.exists('./compiled/public/images', (exists) ->
    if exists
      console.log('images is exists')
    else
      fs.symlinkSync('../../public/images', './compiled/public/images', 'dir')
      console.log('images link is created')
  )

  fs.exists('./compiled/public/stylesheets', (exists) ->
    if exists
      console.log('stylesheets is exists')
    else
      fs.symlinkSync('../../public/stylesheets', './compiled/public/stylesheets', 'dir')
      console.log('stylesheets link is created')
  )

  fs.exists('./compiled/views', (exists) ->
    if exists
      console.log('views is exists')
    else
      fs.symlinkSync('../views', './compiled/views', 'dir')
      console.log('views link is created')
  )
)


task('compile', '编译Coffee为JavaScript', ->
  spawn('jitter', ['.', 'compiled'])
)


task('test', '进行单元测试', ->
  exec('jasmine-node --coffee tests/', (error, stdout, stderr) ->
    console.log(stdout)
  )
)