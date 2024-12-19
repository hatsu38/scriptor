module Scriptor
  class ScriptsController < ApplicationController
    def index
      @scripts = Scriptor::Script.all
    end

    def show
      @script = Scriptor::Script.find(params[:filename])
      @executions = Execution.where(script_filename: @script.filename).order(id: :desc)
    end

    def run
      script = Scriptor::Script.find(params[:filename])
      args = params[:args].to_s.strip.split
      script.run(*args)

      redirect_to script_path(script.filename), notice: "Script executed successfully."
    rescue StandardError => e
      redirect_to script_path(script.filename), alert: "Error executing script: #{e.message}"
    end
  end
end
