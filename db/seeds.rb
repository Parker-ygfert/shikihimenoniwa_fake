# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

species_data = Rails.application.config_for('himes/species')
species_data.each do |species|
  obj = Species.where(name: species).first_or_create
  p "[Species] name: #{obj.name}"
end