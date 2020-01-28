class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :position, :type_question
  belongs_to :author
  belongs_to :survey
end
