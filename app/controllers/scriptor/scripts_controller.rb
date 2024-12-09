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
      script.run

      redirect_to script_path(script.filename, notice: "Script executed successfully.")
    end
  end
end
