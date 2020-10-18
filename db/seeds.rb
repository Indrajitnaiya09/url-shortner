10.times do
  @url = Url.create(original_url: Faker::Internet.url)
  rand(200).times do
    Visitor.create(ip_address: Faker::Internet.ip_v4_address, origin: Faker::Address.country, url_id: @url.id)
  end
end
