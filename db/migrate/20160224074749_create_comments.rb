class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, null: false, index: true
      t.references :opinion, null: false, index: true
      t.string :choice, null: false
      t.text :body
      t.timestamps null: false
    end
  end
end
