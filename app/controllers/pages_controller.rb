class PagesController < ApplicationController

  def home
    @pro_plan = Plan.find(1)
  end

  def about

  end

  def policy

  end

end