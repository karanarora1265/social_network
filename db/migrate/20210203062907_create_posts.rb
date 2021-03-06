class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.text :status
      t.boolean :active

      t.timestamps
    end
  end
end
