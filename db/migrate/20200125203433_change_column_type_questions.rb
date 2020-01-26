class ChangeColumnTypeQuestions < ActiveRecord::Migration[6.0]
  def change
    change_table :questions do |t|
      t.rename :type, :type_question
      t.remove :answer_id
    end
  end
end
