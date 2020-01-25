class Question < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :survey, class_name: 'Survey'
  has_many :answers, class_name: 'Answer', foreign_key: :question_id

  validates :title, presence: true
  validates :type_question, presence: true
  validates :position, presence: true
  validates :survey, presence: true
  validates :author, presence: true

end
