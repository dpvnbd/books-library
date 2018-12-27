FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    publisher { Faker::Book.publisher }
    published_on { Faker::Date.backward(14) }
    number_of_pages { Faker::Number.between(50, 500) }
  end
end