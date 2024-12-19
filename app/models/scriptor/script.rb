require "open3"

module Scriptor
  class Script
    attr_reader :filename, :content

    # コンストラクタでファイル名を受け取る
    def initialize(filename)
      @filename = filename
      @content = load_content
    end

    # クラスメソッドで全スクリプトを取得
    def self.all
      scripts_path = Rails.root.join("script")
      Dir.glob("#{scripts_path}/**/*.rb").map do |file|
        new(file.sub("#{scripts_path}/", "")) # 各スクリプトをインスタンス化
      end
    end

    # クラスメソッドで特定のスクリプトを検索してインスタンス化
    def self.find(filename)
      scripts_path = Rails.root.join("script", "#{filename}.rb")
      return nil unless File.exist?(scripts_path)

      new(filename)
    end

    # スクリプトの実行メソッド
    def run(*args)
      raise "Script content is empty" if content.blank?

      script_path = Rails.root.join("script", "#{filename}.rb")
      raise "Script file does not exist: #{script_path}" unless File.exist?(script_path)

      escaped_args = args.map(&:shellescape).join(" ")
      command = "ruby #{script_path} #{escaped_args}"
      # Rails 環境が正しくロードされるように Rails.root をカレントディレクトリに設定
      execution = Execution.create!(
        script_filename: filename,
        status: :running,
        executed_command: command,
        started_at: Time.current
      )
      Dir.chdir(Rails.root) do
        _, err, status = Open3.capture3(command)
        if status.success?
          # コマンド成功時の処理
          execution.update!(status: :success, finished_at: Time.current)
        else
          error_message = err.presence || "Command failed with exit status #{status.exitstatus}"
          execution.update!(status: :error, error_message: error_message.strip, finished_at: Time.current)
          raise error_message
        end
      end
    end

    private

    # ファイル内容をロード
    def load_content
      script_path = Rails.root.join("script", "#{filename}.rb")
      File.exist?(script_path) ? File.read(script_path).strip : nil
    end
  end
end
