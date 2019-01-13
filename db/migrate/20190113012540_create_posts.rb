class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: { to_table: :users }, index: true
      t.string :title, null: false, default: ""
      t.string :content, null: false, default: ""
      t.timestamps
    end
  end
end
