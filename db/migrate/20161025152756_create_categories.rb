class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :search_term

      t.timestamps null: false
    end
  end
end
