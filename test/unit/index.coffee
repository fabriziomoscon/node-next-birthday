should = require 'should'

nextBirthday = require('../../index')

validBirthday = new Date 1990, 0, 1
validToday = new Date

describe 'getNextBirthday', ->

  describe 'failures', ->

    call() for call in [null, undefined, 0, NaN, false, '', [], {}, new Object(), () ->].map (invalid) ->
      () ->
        it "should not accept #{invalid} as birthday", ->
          ( -> nextBirthday.get invalid, validToday).should.throw "Invalid birthday Date object: #{invalid}"

    call() for call in [0, NaN, false, '', [], {}, new Object(), () ->].map (invalid) ->
      () ->
        it "should not accept #{invalid} as today", ->
          ( -> nextBirthday.get validBirthday, invalid).should.throw "Invalid today Date object: #{invalid}"

  describe 'success', ->

    dates = [
      {
        birthday: new Date(1990, 0, 1)
        today: new Date(2015, 0, 1)
        next_birthday: new Date(2016, 0, 1)
      }
      {
        birthday: new Date(1990, 0, 2)
        today: new Date(2015, 0, 1)
        next_birthday: new Date(2015, 0, 2)
      }
      {
        birthday: new Date(1990, 0, 1)
        today: new Date(2015, 0, 1, 12, 0, 0)
        next_birthday: new Date(2016, 0, 1)
      }
      {
        birthday: new Date(1990, 0, 2)
        today: new Date(2015, 0, 1, 23, 59, 59)
        next_birthday: new Date(2015, 0, 2)
      }
      {
        birthday: new Date(1990, 0, 6)
        today: new Date(2015, 0, 12)
        next_birthday: new Date(2016, 0, 6)
      }
      {
        birthday: new Date(1990, 5, 2)
        today: new Date(2015, 5, 1, 23, 59, 59)
        next_birthday: new Date(2015, 5, 2)
      }
    ]

    call() for call in dates.map (row) ->
      () ->
        it "#{row.birthday.toDateString()} should return the next birthday as #{row.next_birthday.toDateString()} on #{row.today.toDateString()}", ->
          nextBirthday.get(row.birthday, row.today).should.eql row.next_birthday

  describe 'leap years', ->

    dates = [
      {
        birthday: new Date(1988, 1, 29)
        today: new Date(2015, 0, 1)
        next_birthday: new Date(2015, 1, 28)
      }
      {
        birthday: new Date(1988, 1, 29)
        today: new Date(2016, 0, 1)
        next_birthday: new Date(2016, 1, 29)
      }
    ]

    call() for call in dates.map (row) ->
      () ->
        it "#{row.birthday.toDateString()} should return the next birthday as #{row.next_birthday.toDateString()} on #{row.today.toDateString()}", ->
          nextBirthday.get(row.birthday, row.today).should.eql row.next_birthday
