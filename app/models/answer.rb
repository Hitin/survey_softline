class Answer < ApplicationRecord
  belongs_to :question, class_name: 'Question'
  belongs_to :survey, class_name: 'Survey'
end
