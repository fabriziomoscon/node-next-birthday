# node-next-birthday
Returns the next birthday of the birthday passed.

# example

```javascript
var nextBirthday = require('next-birthday')

nextBirthday( new Date(1990, 5, 1) [, new Date(2015, 6, 1) ] )
// new Date(2016, 5, 1) 1st of June 2016
```

the first argument is the actual birthday we want to check and the second argument is optional and represents today's date to be taken as reference, mainly used for tesing purposes.

# test

```
npm test
```

# license

MIT
