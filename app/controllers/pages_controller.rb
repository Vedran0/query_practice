class PagesController < ApplicationController

  def home
    @models = []
    ActiveRecord::Base.connection.tables.drop(1).map do |model|
      @models << model.capitalize.singularize.camelize
    end
  end

end