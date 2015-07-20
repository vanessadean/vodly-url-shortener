# Vodly Url Shortener

Visit http://vodly.herokuapp.com/ to see this app in action.

## Local installation

* fork and clone

* bundle install

* run rake db:create db:migrate

* run rake db:seed to get some seed data for links

* run rake test test/ to see the test suite

## Shortener algorithm

The shortened url is built with 62 characters (a..Z) and (0..9) to create a string similar to a base 62 number. The first character will change with every new url (every 62^0 times), the second character will be added when the 62nd shortened url is created and change every 62th url (62^1), the third character will be added when the url count reaches 3,844 and will change every 3,844th url (62^2) url, etc. 

## Challenges

The biggest challenges I faced were remembering how to use logarithms to calculate a root, figuring out how to display the app's root url in a link (never done that before), and trying out minitest (first time using it).

## Next steps 

I would add user accounts for users to save and see a list of their own shortened urls. My shortener algorithm also seems to be adding that extra digit one count too soon, and I would like to figure out the best way to fix that.
