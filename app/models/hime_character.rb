# frozen_string_literal: true

class HimeCharacter < ApplicationRecord
  include Configurable
  include CharacterAttributable

  enum strength: { original: 0, alert: 1, genuine: 2, extreme: 3 }, _default: :original
  belongs_to :species
  has_one :rank, through: :species
  has_many :exp_configs, through: :rank
  delegate :name, to: :species, prefix: true
  delegate :name, to: :rank, prefix: true
  before_create :generate_name
  before_update :level_upgrade, if: :exp_changed?

  def required_exp
    exp_configs.find_by_level(level + 1).exp
  end

  private

  def generate_name
    self.name = Faker::Creature::Cat.name
  end

  def level_upgrade
    return unless can_level_up
    self.level += 1
    self.exp = 0
  end

  def can_level_up
    exp >= required_exp
  end
end
