# frozen_string_literal: true

class Hime::LevelsController < ApplicationController
  include CharacterAttributable
  before_action :set_himes, only: :index
  before_action :set_species, except: :update
  before_action :set_hime, except: :index

  def index
    @all_species = Species.pluck(:name)
    @attributes = params[:species].present? && attributes
  end

  def show
    generate_hime unless @hime
    @himes = HimeCharacter.includes(:species).where(species: { name: params[:species] })
  end

  def create
    generate_hime
    redirect_to hime_level_path(id: @hime, species: params[:species])
  end

  def update
    @hime.update(exp: @hime.exp + params[:exp].to_i)
    redirect_to hime_level_path(id: @hime, species: @hime.species_name)
  end

  private

  def set_species
    @species = Species.find_by_name params[:species]
  end

  def set_himes
    species = Species.pluck(:name)
    himes = HimeCharacter.includes(:species)
    species.each do |species|
      hime = himes.find { |hime| hime.species.name == species }
      instance_variable_set("@#{species}", hime)
    end
  end

  def set_hime
    @hime = HimeCharacter.find_by_id action_name.inquiry.update? ? params[:hime_id] : params[:id]
  end

  def attributes(level = 10)
    max_level = params[:level].present? ? params[:level].to_i : level
    1.upto(max_level).each_with_object({}) do |level, obj|
      obj[level] = attributes_by_level(params[:species], level)
    end
  end

  def generate_hime
    hime = HimeCharacter.create(species: @species)
    redirect_to hime_level_path(id: hime, species: params[:species])
  end
end
