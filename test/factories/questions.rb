FactoryBot.define do
  factory :question do
    question
    position
    type_question
    survey_id { nil }
    author_id { nil }
  end
end
