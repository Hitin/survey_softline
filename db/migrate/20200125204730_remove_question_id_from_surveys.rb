class RemoveQuestionIdFromSurveys < ActiveRecord::Migration[6.0]
  def change

    remove_column :surveys, :question_id, :integer
  end
end
