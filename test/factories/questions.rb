FactoryBot.define do
  factory :question do
    title { "MyString" }
    position { 1 }
    answer_id { 1 }
    survey_id { 1 }
    type { "" }
    author_id { 1 }
  end
end
