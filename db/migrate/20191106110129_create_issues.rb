class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.string :title
      t.belongs_to :assignee, null: false,  index: true
      t.belongs_to :priority, null: false, foreign_key: true
      t.belongs_to :issue_type, null: false, foreign_key: true
      t.text :description
      t.belongs_to :creator, null: false, foreign_key: false

      t.timestamps
    end
    add_foreign_key :issues, :users, column: :assignee_id
    add_foreign_key :issues, :users, column: :creator_id
  end
end
