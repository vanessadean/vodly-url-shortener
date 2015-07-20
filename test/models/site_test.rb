require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  setup do
    @site = Site.create(original_url: "http://vanessadean.github.io/")
    @site.set_short_code
    @site.save

    @site2 = Site.create(original_url: "http://vanessadean.github.io/")
    @site2.set_short_code
    @site2.save

    @site3 = Site.new(original_url: "http://vanessadean.github.io/")
  end

  test "set short code should build a unique url" do
    assert @site.short_url_code == "b"
    assert @site2.short_url_code == "c"
  end

  test "set short code should build a one digit url for ids < 62" do
    url2 = @site3.url_maker(1)
    assert url2.length == 1
    url2 = @site3.url_maker(61)
    assert url2.length == 1
  end    

  test "set short code should build a two digit url for ids between 62 and 3844" do
    url2 = @site3.url_maker(62)
    assert url2.length == 2
    url2 = @site3.url_maker(3833)
    assert url2.length == 2
  end

  test "set short code should build a three digit url for ids >= 3844" do
    url2 = @site3.url_maker(3844)
    assert url2.length == 3
  end
end
