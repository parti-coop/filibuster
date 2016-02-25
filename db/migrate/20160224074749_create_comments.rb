class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :opinion, null: false, index: true
      t.string :name, null: false
      t.string :choice, null: false
      t.text :body
      t.timestamps null: false
    end
  end
end
