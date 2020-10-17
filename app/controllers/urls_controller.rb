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
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  def show
    @url = find_url_by_unique_name
    if @url && @url.created_at + 30 < Date.today
      # render json: { status: 200, url: @url}
      redirect_to @url.original_url
    else
      render json: { status: 404, message: 'Data you are looking for does not exist' }
    end
  end

  private

  def find_url_by_unique_name
    Url.find_by(short_url: params['unique_name'])
  end

  def check_url_exist
    Url.find_by(original_url: params['url']['original_url'])
  end

  def url_params
    params.require(:url).permit(:original_url)
  end
end
