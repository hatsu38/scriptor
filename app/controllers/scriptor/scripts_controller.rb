module Scriptor
  class ScriptsController < ApplicationController
    def index
      @scripts = Scriptor::Script.all
    end

    def show
      @script = Scriptor::Script.find(params[:filename])
    end

    def run
      script = Scriptor::Script.find(params[:filename])
      args = params[:args].to_s.strip.split
      script.run(*args)

      redirect_to script_path(script.filename, notice: "Script executed successfully.")
    end
  end
end
