class CreateSimplehsmrs < ActiveRecord::Migration
  def self.up
    create_table :simplehsmrs do |t|
      t.string :code
      t.string :name
      t.integer :year
      t.integer :half
      t.float :patients
      t.float :observed
      t.float :expected

      t.timestamps
    end
  end

  def self.down
    drop_table :simplehsmrs
  end
end
