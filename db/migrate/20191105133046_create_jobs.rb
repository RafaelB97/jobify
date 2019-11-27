class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :jobStatus, :default => 0
      t.date :initDate
      t.time :initTime
      t.date :endDate
      t.time :endTime
      t.numeric :payment
      t.text :skills
      t.references :user

      t.timestamps
    end
  end
end
