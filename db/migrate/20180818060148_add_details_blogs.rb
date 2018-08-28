class AddDetailsBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :user_name, :string
    
    add_column :blogs, :user_base, :string    
  end
end
