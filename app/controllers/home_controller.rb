# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to hime_levels_path
  end
end
