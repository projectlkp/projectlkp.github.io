class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :name
      t.string :url
      t.integer :user_id
      t.string :path
      t.string :theme
      t.string :email
      t.string :description
      t.text :about
      t.string :twitter
      t.datetime :last_published_at

      t.timestamps
    end
  end
end
