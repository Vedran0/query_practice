class PagesController < ApplicationController

  def home
  end

  def resource
    file = []
    File.open("#{Rails.root}/app/models/#{params[:resource].singularize}.rb", "r") do |f|
      f.each_line do |line|
        file << line unless line.first == "#" || line == "\n"
      end
    end
    @model_file = file.join("\n")
    @objects = eval("#{params[:resource].singularize.camelize}.all")
  end

end