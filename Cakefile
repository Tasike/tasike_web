exec = require('child_process').exec
spawn = require('child_process').spawn

task 'compile', '编译Coffee为JavaScript', ->
  spawn 'jitter', ['.', '.']

task 'test', '进行单元测试', ->
  exec 'jasmine-node --coffee tests/', (error, stdout, stderr) ->
    console.log stdout

task 'doc', '生成文档', ->
  exec "codo -o ./docs -n 'Tasike' --title 'Tasike Doc' ./config/ ./controllers/ ./helpers/ ./init/ ./libs/ ./models/ ./public/javascripts/ ./tests/", (error, stdout, stderr) ->
    console.log stdout

task 'mongo', '启动MongoDB', ->
  exec 'mongod --config ~/.mongodb/mongodb.conf', (error, stdout, stderr) ->
    console.log stdout

task 'redis', '启动Redis', ->
  exec 'redis-server ~/.redis/redis.conf', (error, stdout, stderr) ->
    console.log stdout


