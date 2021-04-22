class AddBodyToQuotes < ActiveRecord::Migration[6.1]
  def change
    add_column :quotes, :body, :text
  end
end
