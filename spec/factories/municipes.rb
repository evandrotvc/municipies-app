# frozen_string_literal: true

FactoryBot.define do
  factory :municipe do
    name { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    cns { '991619794940009' }
    email { Faker::Internet.email }
    birth_date { Faker::Date.birthday(min_age: 1, max_age: 100) }
    phone { '5561997787269' }
    status { :active }
    photo do
      Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/selfie.png'),
        'image/jpeg')
    end
    address { build(:address) }
  end
end
