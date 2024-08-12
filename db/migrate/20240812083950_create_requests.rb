class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.references :costume, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :status
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
