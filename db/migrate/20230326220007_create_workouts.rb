class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :date
      t.string :caloriesburned
      t.string :duration

      t.timestamps
    end
  end
end
