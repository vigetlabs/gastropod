require "active_record"
require "sqlite3"
require "gastropod"

spec          = Gem::Specification.find_by_name("gastropod")
gem_root      = spec.gem_dir
db_path       = File.join(gem_root, "spec", "db")
db_file_name  = File.join(db_path, "activerecord.db")

Dir.mkdir db_path unless Dir.exists? db_path
SQLite3::Database.new db_path unless File.exist?(db_path)
