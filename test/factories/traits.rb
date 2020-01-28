FactoryBot.define do
  trait :with_author do
    author { create :user }
    author_id { author.id }
  end
end
