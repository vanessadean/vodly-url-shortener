class Site < ActiveRecord::Base
  validates :original_url, presence: true
  after_create :set_short_code

  def set_http
    if !original_url.match(/^http/)
      self.original_url = "http://#{original_url}"
    end
  end

  def set_short_code
    update(short_url_code: url_coder)
  end

  private

  def url_coder
    chars = get_chars
    base = chars.length #62
    id_number = id - 1
    url = chars[id_number % base]
    return url if id_number < 1

    n = Math.log(id_number, base).floor
    n.times do 
      url = chars[id/base**n - 1] + url
    end
    url
  end

  def get_chars
    ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
  end
end
