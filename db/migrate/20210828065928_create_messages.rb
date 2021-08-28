class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string  :content
      t.references :room, null: false, foreign_key: true  #外部キー制約
      t.references :user, null: false, foreign_key: true  #外部キー制約
      t.timestamps
    end
  end
end