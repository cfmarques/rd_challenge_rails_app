FactoryBot.define do
  factory :access do
    association :contact, strategy: :build
    association :page, strategy: :build
    datetime '2017-11-15 07:02:10'
  end
end
