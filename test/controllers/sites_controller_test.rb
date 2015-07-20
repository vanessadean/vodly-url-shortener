require 'test_helper'

class SitesControllerTest < ActionController::TestCase
  setup do
    @site = Site.create(original_url: "http://vanessadean.github.io/")
    @site.set_short_code
    @site.save
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site" do
    assert_difference('Site.count') do
      post :create, site: { original_url: @site.original_url, short_url_code: @site.short_url_code, visits: @site.visits }
    end

    assert_response :redirect
  end

  test "should show site" do
    get :show, id: @site
    assert_response :success
  end

  test "should destroy site" do
    assert_difference('Site.count', -1) do
      delete :destroy, id: @site
    end

    assert_redirected_to sites_path
  end
end
