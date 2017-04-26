class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name,                     null: false
      t.text :text,                       null: false
      t.references :user,                 foreign_key: true,  null: false
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :posts, :deleted_at
  end
end
