json.extract! event, :id, :title, :body, :event_date, :event_time, :enroll, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
