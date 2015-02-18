class DispensariesController < ApplicationController
  before_action :set_leafly_slug
  before_action :set_dispensary

  def show

  end

  def menu
    @menu = @dispensary.leafly_menu
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
    if @leafly_slug
      @dispensary = _leafly_connection.build_dispensary(@leafly_slug)
      @dispensary.leafly_connection = _leafly_connection
    else
      @dispensary = Dispensary.first
    end
  end


end