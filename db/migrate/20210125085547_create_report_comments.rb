class CreateReportComments < ActiveRecord::Migration[5.2]
  def change
    create_table :report_comments do |t|
      t.string :comment_title, null: false
      t.text :comment_content
      t.references :user, foreign_key: true
      t.references :reports, foreign_key: true

      t.timestamps
    end
  end
end
