# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
sites = Site.create([
          {original_url: "https://michellechandra.github.io/synchronicity.html"},
          {original_url: "http://www.bloomberg.com/graphics/2015-paul-ford-what-is-code/"},
          {original_url: "https://www.propublica.org/nerds/item/on-repeat-how-to-use-loops-to-explain-anything"},
          {original_url: "http://www.timeout.com/newyork/restaurants/best-new-york-pizza"},
          {original_url: "http://brooklynbased.com/blog/2015/05/15/clinton-hill-native-shares-neighborhood-lore/"},
          {original_url: "http://grey2scale.itch.io/garbage-cat"},
          {original_url: "http://blogs.wsj.com/metropolis/2015/05/14/new-york-citys-jukebox-heroes-a-musical-map/"},
          {original_url: "http://www.justinweiss.com/blog/2015/06/30/creating-easy-readable-attributes-with-activerecord-enums"},
          {original_url: "http://gitready.com/advanced/2009/02/10/squashing-commits-with-rebase.html"},
          {original_url: "http://www.benjaminlhaas.com/blog/locally-and-remotely-renaming-branch-git"},
          {original_url: "http://www.jeromecukier.net/blog/2011/08/11/d3-scales-and-color/"},
          {original_url: "http://www.leighhalliday.com/where-is-this-method-defined"},
          {original_url: "http://apidock.com/rails/Enumerable/each_with_object"},
          {original_url: "http://coodict.github.io/javascript-in-one-pic/"},
          {original_url: "http://bradfrost.com/blog/post/7-habits-of-highly-effective-media-queries/"}
        ])

sites.each do |site|
  site.visits = rand(1..25)
  site.set_short_code
  site.save
end