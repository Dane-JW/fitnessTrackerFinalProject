json.extract! workout, :id, :name, :date, :caloriesburned, :duration, :created_at, :updated_at
json.url workout_url(workout, format: :json)
