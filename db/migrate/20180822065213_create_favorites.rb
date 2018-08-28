class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :applicant_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
