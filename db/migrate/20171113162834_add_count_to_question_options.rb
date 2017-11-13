class AddCountToQuestionOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :question_options, :picked_count, :integer, default: 0, null: false
  end
end
