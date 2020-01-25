class Survey < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :questions, class_name: 'Question', foreign_key: :survey_id
  has_many :answers, class_name: 'Answer', foreign_key: :survey_id
end
