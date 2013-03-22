ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => "spec/db/activerecord.db")

class Product < ActiveRecord::Base
  extend Gastropod
  include Gastropod::ActiveRecord::Validations

  slug :name
end
