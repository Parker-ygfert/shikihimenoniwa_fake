# frozen_string_literal: true

module Configurable
  extend ActiveSupport::Concern
  
  def configs(filename)
    Rails.application.config_for(filename.to_sym)
  end
end
