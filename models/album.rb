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

def save
  sql = 'INSERT INTO albums(title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id'
  values = [@title, @genre, @artist_id]
  @id = SqlRunner.run(sql,values).first['id'].to_i
end

def self.delete_all
  sql = 'DELETE FROM albums'
  SqlRunner.run(sql)
end

def self.all
  sql = 'SELECT * from albums'
  albums= SqlRunner.run(sql)
  return albums.map { |album| Album.new(album) }
end

def artist()
  sql = 'SELECT * FROM artists WHERE id = $1'
  values = [@artist_id]
  artist_hash= SqlRunner.run(sql, values).first
  return Artist.new(artist_hash)
end

def update
  sql = 'UPDATE albums SET (title, genre) = ($1, $2) WHERE id = $3'
  values = [@title, @genre, @id]
  SqlRunner.run(sql, values)
end

def delete
  sql = 'DELETE FROM albums WHERE id = $1'
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.find_by_id(album)
  sql = 'SELECT * FROM albums WHERE id = $1'
  values = [album]
  album_hash= SqlRunner.run(sql, values).first
  return album_hash.map { |album| Album.new(album) }
end

end
