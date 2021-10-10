# frozen_string_literal: true

class HimeCharacter < ApplicationRecord
  include Configurable
  include CharacterAttributable

  enum strength: { original: 0, alert: 1, genuine: 2, extreme: 3 }, _default: :original
  belongs_to :species
  has_one :rank, through: :species
  delegate :name, to: :species, prefix: true
  delegate :name, to: :rank, prefix: true
  before_create :generate_name

  private

  def generate_name
    self.name = Faker::Creature::Cat.name
  end
end
