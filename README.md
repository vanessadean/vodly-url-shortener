# Vodly Url Shortener

Visit http://vodly.herokuapp.com/ to see this app in action.

## Local installation

* fork and clone

* bundle install

* run rake db:create db:migrate

* run rake db:seed to get some seed data for links

* run rake test test/ to see the test suite

## Shortener algorithm

The shortened url is built with 35 characters (a..z) and (1..9) to create a string similar to a base 35 number. The first character will change with every new url (every 35^0 times), the second character will be added when the 36th shortened url and change for every 35th url (35^1), the third will be added when the url count reaches 1,225 and will change every 1,225th url (35^2), etc. 

The biggest challenges I faced were remembering how to use logarithms to calculate a root, figuring out how to display the app root url in a link, and trying out minitest (first time using it).