class ChangeSiteShortUrl < ActiveRecord::Migration
  def up
    rename_column :sites, :short_url, :short_url_code
  end

  def down
    rename_column :sites, :short_url_code, :short_url
  end
end
