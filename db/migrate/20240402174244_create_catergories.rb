class CreateCatergories < ActiveRecord::Migration[7.1]
  def change
    create_table :catergories do |t|
      t.string :name

      t.timestamps
    end
  end
end
