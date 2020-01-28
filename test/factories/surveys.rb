FactoryBot.define do
  factory :survey do
    title
    author_id { nil }

    trait :with_author do
      author { create :user }
      author_id { author.id }
    end

  end
end
