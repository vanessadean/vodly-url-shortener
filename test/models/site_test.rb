require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  setup do
    @site = Site.create(original_url: "http://vanessadean.github.io/")
    @site.set_short_code
    @site.save

    @site2 = Site.create(original_url: "http://vanessadean.github.io/")
    @site2.set_short_code
    @site2.save
  end

  test "set short code should build a unique url" do
    assert @site.short_url_code == "b"
    assert @site2.short_url_code == "c"
  end
end
