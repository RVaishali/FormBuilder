class CreateFormElements < ActiveRecord::Migration
  def self.up
    create_table :form_elements do |t|
      t.integer :form_id, :null => false
      t.integer :element_id, :null => false
      t.text :condition
      t.string :onload
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :form_elements
  end
end
