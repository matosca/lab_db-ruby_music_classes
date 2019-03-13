require_relative ("../db/sql_runner.rb")
require_relative ("./artist.rb")

class Album

  attr_accessor  :title, :genre
  attr_reader :artist_id, :id

def initialize(options)
  @title = options['title']
  @genre = options['genre']
  @artist_id = options['artist_id'].to_i
  @id = options['id'].to_i if options['id']
end

end 
