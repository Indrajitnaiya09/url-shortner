require 'rails_helper'

RSpec.describe Url, type: :model do
  before(:each) do
    @url = build(:url)
  end
  describe '#new' do
    it 'should initialize a url with valid attributes' do
      expect(@url.original_url).to eq('https://www.flipkart.com/')
    end
  end
  describe '#Create' do
    it 'should create a url with valid attributes' do
      @url.save
      expect(Url.all.count).to eq(1)
    end
  end
  context '#validation' do
    describe '#Original Url' do
      it 'should invalidate url with null value' do
        url = build(:url, :missing_url)
        url.valid?

        expect(url.errors[:original_url]).to include('You provided invalid URL')
      end
      it 'should invalidate url empty string value' do
        url = build(:url, :invalidate_url_if_it_is_empty_string)
        url.valid?

        expect(url.errors[:original_url]).to include('You provided invalid URL')
      end
      it 'should invalidate url with sapec value' do
        url = build(:url, :invalidate_url_if_it_contain_space)
        url.valid?

        expect(url.errors[:original_url]).to include('You provided invalid URL')
      end
    end
  end
  context 'Associations with Visitor' do
    describe 'Has_many' do
      it 'should have has_many association with Visitor' do
        t = Url.reflect_on_association(:visitors)

        expect(t.macro).to eq(:has_many)
      end
    end
  end
end
