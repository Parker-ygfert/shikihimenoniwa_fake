# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rank_data = Rails.application.config_for('himes/ranks')
species_data = Rails.application.config_for('himes/species')
rank_data.each do |rank|
  rank_obj = Rank.where(name: rank).first_or_create
  p "[Rank] name: #{rank_obj.name}"
  next unless species_data[rank]

  species_data[rank].each do |species|
    species_obj = Species.where(name: species, rank_id: rank_obj.id).first_or_create
    p "[Species] name: #{species_obj.name}, rank: #{rank_obj.name}"
  end
end
