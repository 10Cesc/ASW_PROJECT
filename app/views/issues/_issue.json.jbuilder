json.extract! issue, :id, :title, :assignee_id, :priority_id, :issue_type_id, :description, :creator_id, :created_at, :updated_at
json.url issue_url(issue, format: :json)
