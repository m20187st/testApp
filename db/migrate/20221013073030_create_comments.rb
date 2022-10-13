class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
	  t.string :comment, null: false

      t.timestamps
	  t.index [:usre_id, :post_id]
    end
  end
end
