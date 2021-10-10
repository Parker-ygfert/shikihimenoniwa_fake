# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rank_data = Rails.application.config_for('himes/ranks')
species_data = Rails.application.config_for('himes/species')
exp_config_data = Rails.application.config_for('himes/exp_configs')
rank_data.each.with_index(1) do |rank, index|
  rank_obj = Rank.where(id: index, name: rank).first_or_create
  p "[Rank] name: #{rank_obj.name}"
  next unless species_data[rank]

  species_data[rank].each.with_index(1) do |species, index|
    species_obj = Species.where(id: index, name: species, rank_id: rank_obj.id).first_or_create
    p "[Species] name: #{species_obj.name}, rank: #{rank_obj.name}"
  end

  exp_config_data[rank].each do |level, exp|
    exp_config_obj = ExpConfig.where(level: level, exp: exp, rank_id: rank_obj.id).first_or_create
    p "[ExpConfig] level: #{exp_config_obj.level}, exp: #{exp_config_obj.exp}, rank: #{rank_obj.name}"
  end
end
