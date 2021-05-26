class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :user, foreign_key: true
      t.string :status
      t.string :content

      t.timestamps
    end
  end
end
