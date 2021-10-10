# frozen_string_literal: true

class Species < ApplicationRecord
  belongs_to :rank
  has_many :hime_characters
  validates :name, uniqueness: :true
  delegate :name, to: :rank, prefix: true
end
