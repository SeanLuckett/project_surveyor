class CreateQuestionOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :question_options do |t|
      t.string :body, null: false
      t.references :multi_choice_question, foreign_key: true

      t.timestamps
    end
  end
end
