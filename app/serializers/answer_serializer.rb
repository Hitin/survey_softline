class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :question
  belongs_to :survey
end