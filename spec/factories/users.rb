FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { 'やマ田' }
    last_name             { '太ろウ' }
    first_name_yomi       { 'ヤマダ' }
    last_name_yomi        { 'タロウ' }
    birth_date            { Faker::Date.between(from: '1930-01-01', to: '2018-12-31') }
  end
end
