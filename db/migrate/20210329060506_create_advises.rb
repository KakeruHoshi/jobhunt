class CreateAdvises < ActiveRecord::Migration[6.1]
  def change
    create_table :advises do |t|
      t.text :body

      t.timestamps
    end
  end
end
