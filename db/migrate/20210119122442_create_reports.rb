class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :title, null: false
      t.text :content
      t.integer :time, null: false
      t.date :date, null: false
      t.string :place
      t.text :image
      t.bigint "report_id"
    end
  end
end
