class ChangeColumnQuestionQuestions < ActiveRecord::Migration[6.0]
  def change
    change_table :questions do |t|
      t.rename :question, :title
    end
  end
end
