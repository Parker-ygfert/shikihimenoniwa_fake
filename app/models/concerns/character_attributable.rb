 # frozen_string_literal: true

 module CharacterAttributable
  extend ActiveSupport::Concern
  include Configurable

  ATTRIBUTES = %i[hp attack defense agility behavior].freeze

  def character_attributes(species)
    species = species.downcase.to_sym
    @character_attributes = configs('himes/attributes')[species]
  end
    
  def original_values
    @character_attributes[:original]
  end

  def increase_values
    @character_attributes[:increase]
  end

  def attributes_by_level(species, level = 1)
    character_attributes(species)
    ATTRIBUTES.each_with_object({}) do |attr, obj|
      obj[attr] = original_values[attr] + increase_values[attr] * (level - 1)
    end
  end
 end
 