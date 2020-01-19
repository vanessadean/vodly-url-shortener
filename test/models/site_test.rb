require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  setup do
    @site = Site.create(original_url: "http://vanessadean.github.io/")
    @site2 = Site.create(original_url: "http://beenverified.com")
  end

  test "set_short_code builds a unique 1 digit url for ids up to 62" do
    @site.set_short_code
    assert @site.short_url_code == 'a'
    assert @site.short_url_code.length == 1    
    @site.update_attribute(:id, 62)
    @site.set_short_code
    assert @site.short_url_code == '9'
    assert @site.short_url_code.length == 1
  end    

  test "set_short_code builds a unique 2 digit url for ids between 62 (62**1) and 3844 (62**2)" do
    @site.update_attribute(:id, 63)
    @site.set_short_code
    assert @site.short_url_code == 'aa'
    assert @site.short_url_code.length == 2
    @site.update_attribute(:id, 3844)
    @site.set_short_code
    assert @site.short_url_code == '99'
    assert @site.short_url_code.length == 2
  end

  test "set_short_code builds a unique 3 digit url for ids between 3844 (62**2) and 238328 (62**3)" do
    @site.update_attribute(:id, 3845)
    @site.set_short_code
    assert @site.short_url_code == 'aaa'
    assert @site.short_url_code.length == 3
    @site.update_attribute(:id, 238328)
    @site.set_short_code
    assert @site.short_url_code == '999'
    assert @site.short_url_code.length == 3
  end

  test "set_short_code builds a unique 4 digit url for ids between 238328 (62**3) and 14776336 (62**4)" do
    @site.update_attribute(:id, 238329) 
    @site.set_short_code
    assert @site.short_url_code == 'aaaa'
    assert @site.short_url_code.length == 4
    @site.update_attribute(:id, 14776336)
    @site.set_short_code
    assert @site.short_url_code == '9999'
    assert @site.short_url_code.length == 4
  end
end
