# frozen_string-literal:true

FactoryBot.define do
  factory :url do
    original_url { 'https://www.flipkart.com/' }

    trait :missing_url do
      original_url {}
    end

    trait :invalidate_url_if_it_is_empty_string do
      original_url { '' }
    end

    trait :invalidate_url_if_it_contain_space do
      original_url { 'https://www.flip kart.com/' }
    end
  end
end
