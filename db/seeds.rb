# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   jobss = jobs.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', jobs: jobss.first)
#
#create_table "jobs", force: :cascade do |t|
#  t.string "name"
#  t.text "summary"
#  t.text "description"
#  t.decimal "payment"
#  t.date "jobDate"
#  t.datetime "created_at", null: false
#  t.datetime "updated_at", null: false
#


100.times do |index|
  Job.create!( name: Faker::Name.name,
                summary: Faker::Lorem.sentence(3, false, 0).chop,
                description: Faker::Lorem.paragraph,
                payment: Faker::Number.between(1, 1000),
                jobDate: Faker::Lorem.sentence(3, false, 0).chop,
                created_at: Faker::Date.forward,
                updated_at: Faker::Date.forward)
end
