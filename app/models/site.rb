class Site < ActiveRecord::Base
  validates :original_url, presence: true

  def set_short_code
    self.short_url_code = url_maker(self.id)
  end

  def url_maker(id)
    @chars = get_chars
    @base = @chars.length #62
    url = @chars[id % @base]
    n = Math.log(id, @base).floor
    n.times do 
      url += @chars[id/@base**n]
    end
    url
  end

  def get_chars
    ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
  end
end
