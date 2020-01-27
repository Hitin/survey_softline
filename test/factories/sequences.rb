FactoryBot.define do
  sequence :name do |n|
    "name#{n}"
  end
  sequence :description do |n|
    "description#{n}"
  end
  sequence :first_name do |n|
    "first_name#{n}"
  end
  sequence :last_name do |n|
    "last_name#{n}"
  end
  sequence :password do |n|
    "password#{n}"
  end
  sequence :email do |n|
    "email#{n}@factory.com"
  end
  sequence :title do |n|
    "survey#{n}"
  end
  sequence :question do |n|
    "question#{n}"
  end
  sequence :position do |n|
    n
  end
  sequence :type_question do |n|
    "text"
  end
  sequence :answer do |n|
    "answer#{n}"
  end
  sequence :string do |n|
    "string#{n}"
  end

  
end