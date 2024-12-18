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
      raise "Script content is empty" unless content.present?

      script_path = Rails.root.join("script", "#{filename}.rb")
      raise "Script file does not exist: #{script_path}" unless File.exist?(script_path)

      # Rails 環境が正しくロードされるように Rails.root をカレントディレクトリに設定
      Dir.chdir(Rails.root) do
        escaped_args = args.map(&:shellescape).join(" ")
        system("ruby #{script_path} #{escaped_args}")
      end
    rescue => e
      Rails.logger.error "Error running script #{filename}: #{e.message}"
      raise e
    end

    private

    # ファイル内容をロード
    def load_content
      script_path = Rails.root.join("script", "#{filename}.rb")
      File.exist?(script_path) ? File.read(script_path).strip : nil
    end
  end
end
