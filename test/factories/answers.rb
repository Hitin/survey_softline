FactoryBot.define do
  factory :answer do
    title
    survey_id { nil }
    question_id { nil }
  end
end
