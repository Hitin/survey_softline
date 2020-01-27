class ChangeColumnTitleQuestions < ActiveRecord::Migration[6.0]
  def change
    change_table :questions do |t|
      t.rename :title, :question
    end
  end
end
