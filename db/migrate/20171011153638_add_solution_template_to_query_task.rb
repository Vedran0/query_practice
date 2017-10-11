class AddSolutionTemplateToQueryTask < ActiveRecord::Migration
  def change
    add_column :query_tasks, :solution_template, :text
  end
end