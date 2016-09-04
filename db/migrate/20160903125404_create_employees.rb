class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :title
      t.string :bio
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
