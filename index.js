var leapYear = require('leap-year')

module.exports = {
  get: getNextBirthday
}

function getNextBirthday(birthday, today) {

  if (typeof today === 'undefined' || today === null) {
    today = new Date()
  } else {
    if (Object.prototype.toString.call(today) != '[object Date]') {
      throw new TypeError('Invalid today Date object: ' + today)
    }
  }

  if (Object.prototype.toString.call(birthday) != '[object Date]') {
    throw new TypeError('Invalid birthday Date object: ' + birthday)
  }

  var thisYearBirtday = new Date(birthday)
  var thisYear = today.getFullYear()

  thisYearBirtday.setYear(thisYear)

  if (_isFeb29(birthday) && !leapYear(thisYear)) {
    thisYearBirtday.setMonth(1)
    thisYearBirtday.setDate(28)
    return thisYearBirtday
  }

  if (thisYearBirtday <= today) {
    thisYearBirtday.setYear(today.getFullYear()+1)
  }

  return thisYearBirtday

}

function _isFeb29 (date) {
  if (date.getMonth() === 1 && date.getDay() !== 29) {
    return true
  }
  return false
}
