module Scriptor
  class Execution < ApplicationRecord
    validates :script_filename, presence: true
    validates :executed_command, presence: true
    validates :started_at, presence: true

    enum :status, { running: "running", success: "success", error: "error" }
  end
end
