class AddResourceAndSingularOrPluralToQueryTask < ActiveRecord::Migration
  def change
    add_column :query_tasks, :resource, :string
    add_column :query_tasks, :singularize, :boolean, default: false
  end
end
