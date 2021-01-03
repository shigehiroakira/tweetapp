FactoryBot.define do
  factory :user do
      nickname { Faker::Name.initials(number: 2) }
      gimei = Gimei.name
  
      last_name       { Gimei.last.kanji }
      first_name        { Gimei.first.kanji }
  
      last_name_kana  { Gimei.last.katakana }
      first_name_kana   { Gimei.first.katakana }
      birthday { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  
      email                 { Faker::Internet.free_email }
      password              { Faker::Internet.password(min_length: 6) }
      password_confirmation { password }
    
  end
end