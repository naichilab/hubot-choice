Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../src/choice.coffee')

describe 'choice', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'responds to choice', ->
    @room.user.say('alice', '@hubot A,B,Cから選んで!!').then =>
      expect(['@alice Aで！！','@alice Bで！！','@alice Cで！！']).to.include(@room.messages[1][1])
