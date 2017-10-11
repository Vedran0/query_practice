class PagesController < ApplicationController

  def home
    @models = (ActiveRecord::Base.connection.tables.map.to_a - ["users", "schema_migrations", "solutions", "query_tasks"])
  end

end