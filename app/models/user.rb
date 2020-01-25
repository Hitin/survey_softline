class User < ApplicationRecord
  has_secure_password
  has_many :my_surveys, class_name: 'Survey', foreign_key: :author_id
  has_many :my_questions, class_name: 'Question', foreign_key: :author_id
end
