class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.timestamps #created_at #updated_at
    end
  end
end