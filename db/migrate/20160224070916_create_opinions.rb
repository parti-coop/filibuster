class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.string "title", null: false
      t.text "body"
      t.references "user", null: false, index: true
      t.integer "agree_count", default: 0
      t.integer "disagree_count", default: 0
      t.timestamps null: false
    end
  end
end
