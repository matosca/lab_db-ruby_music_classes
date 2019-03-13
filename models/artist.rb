require_relative ("../db/sql_runner.rb")
require_relative ("./album.rb")

class Artist

  attr_accessor  :name
  attr_reader :id

def initialize(options)
  @name = options['name']
  @id = options['id'].to_i if options['id']
end

def save
  sql = 'INSERT INTO artists(name) VALUES ($1) RETURNING id'
  values = [@name]
  @id = SqlRunner.run(sql,values).first['id'].to_i
end

end
