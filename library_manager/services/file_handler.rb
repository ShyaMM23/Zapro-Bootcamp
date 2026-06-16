require 'csv'
require 'fileutils'

module FileHandler
  SAVE_FILE = "books.csv"

  def self.backup_library
    if File.exist?(SAVE_FILE)
      FileUtils.cp(SAVE_FILE, "backup_books.csv")
      puts "Backup Created: backup_books.csv"
    end
  end

  def self.save_library(library)
    CSV.open(SAVE_FILE, "w") do |csv|
      csv << ["title", "author", "year", "genre", "type", "url", "duration_minutes"]

      library.books.each do |b|
        if b.is_a?(DigitalBook)
          csv << [b.title, b.author, b.year, b.genre, "Digital", b.url, ""]
        elsif b.is_a?(AudioBook)
          csv << [b.title, b.author, b.year, b.genre, "Audio", "", b.duration_minutes]
        else
          csv << [b.title, b.author, b.year, b.genre, "Physical", "", ""]
        end
      end
    end

    puts "Library has been saved."
  end

  def self.load_library(library)
    return unless File.exist?(SAVE_FILE)

    CSV.foreach(SAVE_FILE, headers: true) do |row|
      case row["type"]
      when "Digital"
        library.add_digital_book(
          row["title"],
          row["author"],
          row["year"].to_i,
          row["genre"],
          row["url"]
        )
      when "Audio"
        library.add_audio_book(
          row["title"],
          row["author"],
          row["year"].to_i,
          row["genre"],
          row["duration_minutes"].to_i
        )
      else
        library.add(
          row["title"],
          row["author"],
          row["year"].to_i,
          row["genre"]
        )
      end
    end

    puts "Loaded #{library.books.size} books."
  end
end