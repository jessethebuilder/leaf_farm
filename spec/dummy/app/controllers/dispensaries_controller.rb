class DispensariesController < ApplicationController
  before_action :set_leafly_slug
  before_action :set_dispensary

  def show

  end

  def menu
    @menu = @dispensary.menu
  end

  def info

  end

  private

  def _leafly_connection
    Dispensary.first.leafly_connection
  end

  def set_leafly_slug
    @leafly_slug = params[:leafly_id]
  end

  def set_dispensary
    @dispensary = Dispensary.find_or_build_from_leafly_slug('denver-relief', LeaflyConnection.first, :update_frequency => Integer(8.hours))
    @dispensary.save if Dispensary.count == 0
    @dispensary
  end


end