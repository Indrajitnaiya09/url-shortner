require 'rails_helper'

RSpec.describe Visitor, type: :model do
  before(:each) do
    @url1 = build(:url)
    @url1.save
    @visitor = build(:visitor)
    @visitor.url_id = @url1.id
  end
  describe '#new' do
    it 'should initialize a visitor with valid attributes' do
      expect(@visitor.ip_address).to eq('10.40.20.11')
      expect(@visitor.origin).to eq('India')
    end
  end
  describe '#Create' do
    it 'should create a visitor with valid attributes' do
      @visitor.save

      expect(Visitor.all.count).to eq(1)
    end
  end
  context '#validation' do
    describe '#Visitor' do
      it 'should invalidate ip with null value' do
        visitor = build(:visitor, :missing_ip)
        visitor.url_id = @url1.id
        visitor.valid?

        expect(visitor.errors[:ip_address]).to include("can't be blank")
      end
      it 'should invalidate ip empty string value' do
        visitor = build(:visitor, :invalidate_ip_if_it_is_empty_string)
        visitor.valid?

        expect(visitor.errors[:ip_address]).to include("can't be blank")
      end
    end
  end
  context 'Associations with URL' do
    describe 'url_id' do
      it 'should have belongs_to association with url' do
        t = Visitor.reflect_on_association(:url)

        expect(t.macro).to eq(:belongs_to)
      end
    end
  end
end
