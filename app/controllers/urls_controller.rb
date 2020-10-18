# Frozen_string_literal:true

class UrlsController < ApplicationController
  def create
    # binding.pry
    @url = check_url_exist || Url.new(url_params)
    if @url.id
      render json: { status: 200, url: @url}
    elsif @url.save
      render json: { status: 201, url: @url }
    else
      render json: {url: @url.errors, status: 422}
    end
  end

  def show
    @url = find_url_by_unique_name
    if @url && expire_check
      url_accessed(@url)
      redirect_to @url.original_url
      # render json: { status: 200, url: @url}
    else
      render json: { status: 404, message: 'Data you are looking for does not exist' }
    end
  end

  def stat
    @data = Url.statistic
    render json: { status: 200, urls: @data}
  end

  private

  def expire_check
    @url.created_at > Date.today - 30 || false
  end

  def find_url_by_unique_name
    Url.find_by(short_url: params['unique_name'])
  end

  def check_url_exist
    Url.find_by(original_url: params['url']['original_url'])
  end

  def url_params
    params.require(:url).permit(:original_url)
  end

  def url_accessed(url)
    Visitor.create(ip_address: request.env["HTTP_X_FORWARDED_FOR"], origin: Faker::Address.country, url_id: url.id)
  end
end
