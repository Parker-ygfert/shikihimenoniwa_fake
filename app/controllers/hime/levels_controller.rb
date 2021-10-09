# frozen_string_literal: true

class Hime::LevelsController < ApplicationController
  def index
    @hime = HimeCharacter.find_by_id params[:id]
    @attributes = attributes(params[:level]) if @hime
  end

  def create
    species = Species.find_by_name params[:species]
    hime = HimeCharacter.where(species: species).first_or_create
    redirect_to hime_levels_path(id: hime)
  end

  def attributes(max_level)
    max_level = max_level.present? ? max_level.to_i : 10
    1.upto(max_level).each_with_object({}) do |level, obj|
      obj[level] = @hime.attributes_by_level(@hime.species.name, level)
    end
  end
end
