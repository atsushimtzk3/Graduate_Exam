class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.datetime :starting_time
      t.datetime :finishing_time
      t.integer :recruitment_number
      t.integer :user_id
      t.integer :applicant_id
      t.integer :applicant_number

      t.timestamps
    end
  end
end
