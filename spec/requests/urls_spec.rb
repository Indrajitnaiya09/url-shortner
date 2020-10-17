# frozen_string_literal:true

require 'rails_helper'

RSpec.describe 'Urls', type: :request do
  before do
    @url1 = build(:url)
    @url2 = build(:url, :missing_url)
    @url3 = build(:url, :invalidate_url_if_it_is_empty_string)
    @url4 = build(:url, :invalidate_url_if_it_contain_space)
  end

  context '#POST /urls' do
    describe 'With valid url' do
      it 'should return short url' do
        post urls_path,
        params: {
          "urls": @url1.attributes
        }

        expect(response).to have_http_status(200)
      end
    end
    describe 'With invalid url' do
      it 'should invalidate if enter url is an empty' do
        post urls_path,
        params: {
          "urls": @url2.attributes
        }
        response_data = JSON.parse(response.body)
        type = response_data['original_url'].include? 'You provided invalid URL'

        expect(response).to have_http_status(422)
        expect(type).to eq(true)
      end
      it 'should invalidate if enter url is an empty string' do
        post urls_path,
        params: {
          "urls": @url3.attributes
        }
        response_data = JSON.parse(response.body)
        type = response_data['original_url'].include? 'You provided invalid URL'

        expect(response).to have_http_status(422)
        expect(type).to eq(true)
      end
      it 'should invalidate if it contain space' do
        post urls_path,
        params: {
          "urls": @url4.attributes
        }
        response_data = JSON.parse(response.body)
        type = response_data['original_url'].include? 'You provided invalid URL'

        expect(response).to have_http_status(422)
        expect(type).to eq(true)
      end
    end
  end
end
