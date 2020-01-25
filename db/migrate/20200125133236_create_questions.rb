class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :position
      t.integer :answer_id
      t.integer :survey_id
      t.string :type
      t.integer :author_id

      t.timestamps
    end
  end
end
