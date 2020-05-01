class CreateFormDatas < ActiveRecord::Migration
  def self.up
    create_table :form_datas do |t|
      t.integer :form_id
      t.integer :user_id
      t.text :form_value
      t.timestamps
    end
  end

  def self.down
    drop_table :form_datas
  end
end
