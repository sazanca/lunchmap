FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 7)
    #nickname              {Faker::Name.first_name}
    nickname              {Faker::Lorem.word}
    employee_id           {"00000l"}
    password              {"password"}
    password_confirmation {"password"}
  end
end