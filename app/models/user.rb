class User < ApplicationRecord
  has_secure_password
  has_many :my_surveys, class_name: 'Survey', foreign_key: :author_id
  has_many :my_questions, class_name: 'Question', foreign_key: :author_id

  validates :first_name, presence: true,
                         length: { minimum: 2 }
  validates :last_name, presence: true,
                        length: { minimum: 2 }
  validates :email, presence: true,
                    uniqueness: true, 
                    format: { with: /.*@.*/, message: "doesn't contein sym @" }
  def name
    "#{first_name} #{last_name}"
  end
  
end
