FactoryBot.define do
  factory :visitor do
    ip_address { '10.40.20.11' }
    origin { 'India' }

    trait :missing_ip do
      ip_address {}
    end

    trait :invalidate_ip_if_it_is_empty_string do
      ip_address { '' }
    end
  end
end
