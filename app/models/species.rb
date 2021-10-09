# frozen_string_literal: true

class Species < ApplicationRecord
  has_many :hime_characters
  validates :name, uniqueness: :true
end
