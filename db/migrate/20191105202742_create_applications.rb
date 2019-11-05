class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.references :job, foreign_key: true
      t.references :user
      t.boolean :accepted, :default => false
      t.integer :rateJob
      t.integer :rateEmployee
      t.numeric :amount
      t.boolean :paid, :default => false

      t.timestamps
    end
  end
end
