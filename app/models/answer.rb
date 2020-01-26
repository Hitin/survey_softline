class Answer < ApplicationRecord
  belongs_to :question, class_name: 'Question'
  belongs_to :survey, class_name: 'Survey'

  validates :title, presence: true
  validates :question, presence: true
  validates :survey, presence: true

end
