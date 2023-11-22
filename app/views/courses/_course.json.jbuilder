json.extract! course, :id, :name, :start_date, :duration, :price, :created_at, :updated_at
json.url course_url(course, format: :json)
