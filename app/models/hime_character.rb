# frozen_string_literal: true

class HimeCharacter < ApplicationRecord
  include Configurable
  include CharacterAttributable

  belongs_to :species
  enum strength: { original: 0, alert: 1, genuine: 2, extreme: 3 }, _default: :original
  before_create :generate_name

  private

  def generate_name
    self.name = Faker::Creature::Cat.name
  end
end
