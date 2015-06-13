# node-next-birthday [![Build Status](https://travis-ci.org/fabriziomoscon/node-next-birthday.svg)](https://travis-ci.org/fabriziomoscon/node-next-birthday)

Returns the next birthday of the birthday passed.

## Install

```
$ npm install --save next-birthday
```

## Usage

```javascript
var nextBirthday = require('next-birthday')
var birthday = new Date(1990, 5, 1)

nextBirthday.get(birthday)
//=> new Date(2016, 5, 1) 1st of June 2016
```

## API

### get(birthday[, today]))

#### birthday
Type: `date`
##### today [optional]
Type: `date`
Default: `new Date()`

the first argument is the actual birthday we want to check and the second argument is optional and represents today's date to be taken as reference, mainly used for tesing purposes.

## Leap years
Using [leap-year](https://github.com/datetime/leap-year) to calculate the correct next birthdays for leap year bithrdays. Using the 28th of February.

## Test

```
npm test
```

## License

MIT
