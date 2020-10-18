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
          "url": @url1.attributes
        }

        expect(response).to have_http_status(200)
      end
    end
    describe 'With invalid url' do
      it 'should invalidate if enter url is an empty' do
        post urls_path,
        params: {
          "url": @url2.attributes
        }

        response_data = JSON.parse(response.body)
        type = response_data['url']['original_url'].include? 'You provided invalid URL'

        expect(response_data['status']).to eq(422)
        expect(type).to eq(true)
      end
      it 'should invalidate if enter url is an empty string' do
        post urls_path,
        params: {
          "url": @url3.attributes
        }
        response_data = JSON.parse(response.body)
        type = response_data['url']['original_url'].include? 'You provided invalid URL'

        expect(response_data['status']).to eq(422)
        expect(type).to eq(true)
      end
      it 'should invalidate if it contain space' do
        post urls_path,
        params: {
          "url": @url4.attributes
        }
        response_data = JSON.parse(response.body)
        type = response_data['url']['original_url'].include? 'You provided invalid URL'

        expect(response_data['status']).to eq(422)
        expect(type).to eq(true)
      end
    end
  end
  context '#GET /stat' do
    describe 'Analysis Report' do
      it 'should return statistic report for each url' do
        post urls_path,
        params: {
          "url": @url1.attributes
        }
        get stat_path

        response_data = JSON.parse(response.body)
        expect(response_data['status']).to eq(200)
        expect(response_data['urls'].count).to eq(1)
      end
    end
  end
  context '#GET /unique_name' do
    describe 'entered invalidate short url' do
      it 'should not redirect to main website' do
        post urls_path,
        params: {
          "url": @url1.attributes
        }
        response_data1 = JSON.parse(response.body)
        short_url = response_data1['url']['short_url']

        get urls_path(short_url)

        response_data2 = JSON.parse(response.body)
        expect(response_data2['status']).to eq(404)
        expect(response_data2['message']).to eq('Data you are looking for does not exist')
      end
    end
  end
end
