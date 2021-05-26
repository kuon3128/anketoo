class ChangeOptionStatusToQuestions < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :status, :boolean, null: false, default: true
  end
end
