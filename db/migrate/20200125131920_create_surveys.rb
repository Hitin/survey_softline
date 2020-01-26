class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.string :title
      t.integer :author_id
      t.integer :question_id

      t.timestamps
    end
  end
end
