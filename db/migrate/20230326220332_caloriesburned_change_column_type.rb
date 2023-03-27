class CaloriesburnedChangeColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column(:workouts, :caloriesburned, :int)
  end
end
