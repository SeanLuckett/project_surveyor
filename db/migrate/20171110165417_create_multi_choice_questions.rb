class CreateMultiChoiceQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :multi_choice_questions do |t|
      t.references :survey, foreign_key: true
      t.string :body
      t.boolean :required, default: true
      t.boolean :multipart, default: false

      t.timestamps
    end
  end
end
