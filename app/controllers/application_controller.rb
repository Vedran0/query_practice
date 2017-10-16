class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_resources_list

  private

    def set_resources_list
      @models = (ActiveRecord::Base.connection.tables.map.to_a - ["users", "schema_migrations", "solutions", "query_tasks", "comments"])
    end

end
