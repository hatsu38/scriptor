require_relative "../../config/environment"

title, text = ARGV
if title.nil? || text.nil?
  puts "Usage: #{$0} TITLE TEXT"
  exit 1
end

Article.create!(title: title, text: text)
puts "Article created: #{title}"
