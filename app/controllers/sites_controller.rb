class SitesController < ApplicationController
  def index
    @site = Site.new
    @sites = Site.limit(100).order(visits: :desc)
  end

  def show
    @site = Site.find(params[:id])
  end

  def visit
    @site = Site.find_by(short_url_code: params[:id])
    @site.visits += 1
    @site.save
    redirect_to @site.original_url
  end

  def new
    @site = Site.new
  end
  
  def create
    @site = Site.new(original_url: site_params[:original_url])
    @site.set_http
    request = HTTParty.get(@site.original_url) rescue nil

    if !request.nil?
      @site.save

      redirect_to @site
    else
      render :new
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url, notice: 'Site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def site_params
    params.require(:site).permit(:original_url, :short_url, :visits)
  end
end
