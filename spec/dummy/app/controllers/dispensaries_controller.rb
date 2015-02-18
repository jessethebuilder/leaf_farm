class DispensariesController < ApplicationController
  before_action :set_dispensary

  def show
  end

  def menu

    @menu = @dispensary.menu

  end

  def info

  end

  private

  def set_dispensary
    @dispensary = Dispensary.find_or_build_from_leafly_slug(_leafly_slug)
  end

  def _leafly_slug
    params[:leafly_id] || 'green-orchard'
  end

end