class ChangeColumnAnswerAnswers < ActiveRecord::Migration[6.0]
  def change
    change_table :answers do |t|
      t.rename :answer, :title
    end
  end
end
