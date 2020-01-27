class ChangeColumnTitleAnswers < ActiveRecord::Migration[6.0]
  def change
    change_table :answers do |t|
      t.rename :title, :answer
    end
  end
end
