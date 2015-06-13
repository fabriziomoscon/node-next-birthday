module.exports = function (birthday, today) {

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

  thisYearBirtday.setYear(new Date().getFullYear())

  if (thisYearBirtday <= today) {
    thisYearBirtday.setYear(new Date().getFullYear()+1)
  }

  return thisYearBirtday

}
