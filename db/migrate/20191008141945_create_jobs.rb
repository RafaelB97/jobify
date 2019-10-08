class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :summary
      t.text :description
      t.decimal :payment
      t.date :jobDate

      t.timestamps
    end
  end
end
