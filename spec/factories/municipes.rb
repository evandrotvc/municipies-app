# frozen_string_literal: true

FactoryBot.define do
  factory :municipe do
    name { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    cns { '991619794940009' }
    email { Faker::Internet.email }
    birth_date { Faker::Date.birthday(min_age: 1, max_age: 100) }
    phone { '+55 (61) 98455-4529' }
    status { :active }
    photo { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/municipe.jpg'), 'image/jpeg') }
    address { create(:address) }
  end
end
