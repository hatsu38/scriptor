module Scriptor
  class Execution < ApplicationRecord
    validates :script_filename, presence: true
    validates :executed_command, presence: true
    validates :started_at, presence: true

    enum :status, { running: "running", success: "success", error: "error" }

    #
    # Rails.rootパスを.に置換。想定として、"ruby /Users/hatsu/..."のように
    # ruby [space]の直後にRails.root.to_sが現れることを想定しているため、
    # /^ruby\s+#{Rails.root}/ のような正規表現で置き換える。
    #
    def truncated_command
      executed_command.sub(/^ruby\s+#{Regexp.escape(Rails.root.to_s)}/, "ruby .")
    end
  end
end
