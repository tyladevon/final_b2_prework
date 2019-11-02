class CreateStudent < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.timestamp
    end
  end
end
