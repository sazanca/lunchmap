FactoryBot.define do
  
  factory :shop do
    name                    {"恵比寿 天下一 神谷町店"}
    arrivaltime             {5}
    ganre                   {2}
    price                   {1000}
    user                    { create(:user) }
  end
end
