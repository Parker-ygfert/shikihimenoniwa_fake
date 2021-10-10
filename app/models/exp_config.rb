# frozen_string_literal: true

class ExpConfig < ApplicationRecord
  belongs_to :rank
  delegate :name, to: :rank, prefix: true
end
