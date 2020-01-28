FactoryBot.define do
  factory :question do
    title
    position
    type_question
    survey_id { nil }
    author_id { nil }
  end
end
