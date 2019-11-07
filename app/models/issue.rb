class Issue < ApplicationRecord
  belongs_to :assignee, :class_name => "User", :foreign_key => "assignee_id"
  belongs_to :priority
  belongs_to :issue_type
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"
end
