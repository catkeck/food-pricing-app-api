# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'butter-grams-data.csv'))
CSV.parse(csv_text, :headers => true) do |row|
  i = Ingredient.new
  i.name = row['name']
  i.cost = row['cost']
  i.unit = row['unit']
  i.cost_per_butter_gram = row['cost_per_butter_gram']
  i.butter_unit = row['butter_unit']
  i.save
end