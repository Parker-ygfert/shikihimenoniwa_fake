# frozen_string_literal: true

class Rank < ApplicationRecord
  has_many :species
  has_many :exp_configs
end
