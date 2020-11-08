class AddCardToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :card, null: false, foreign_key: true
  end
end
