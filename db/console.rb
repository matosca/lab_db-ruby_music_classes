require("pry")
require_relative("../models/artist.rb")
require_relative("../models/album.rb")

Album.delete_all
Artist.delete_all()


artist1 = Artist.new({ 'name' => 'Queen'})
artist1.save

artist2 = Artist.new ( {'name' => 'Brain May'})
artist2.save
#
#
# artist1.name = "Freddy Mercury"
# artist1.update
#
# artist2.delete
#
# album1 = Album.new({ 'title' => 'QueenII', 'genre' => 'rock', 'artist_id' => artist1.id })
# album1.save
#
# album2 = Album.new({ 'title' => 'Innuendo', 'genre' => 'rock', 'artist_id' => artist1.id })
# album2.save
#
# album1.title = "Mr. Bad Guy"
# album1.update
#
# album2.delete

Artist.find_by_id(artist1)
Album.find_by_id(album1)

Album.all
Artist.all



binding.pry
nil
