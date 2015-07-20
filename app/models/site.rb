class Site < ActiveRecord::Base
  validates :original_url, presence: true

  def set_short_code
    self.short_url_code = url_maker(self.id)
  end

  private
  def url_maker(id)
    chars = ("a".."z").to_a + ("1".."9").to_a
    url = chars[id%35]
    n = Math.log(id, 35).floor
    n.times do 
      url += chars[id/35**n]
    end
    url
  end
end
