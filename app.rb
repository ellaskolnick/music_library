# file: app.rb

require_relative './lib/album_repository'
require_relative './lib/artist_repository'
require_relative './lib/database_connection'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    show "Welcome to the music library manager!"
    show "What would you like to do?"
    show " 1 - List all albums"
    show " 2 - List all artists"
    choice = prompt "Enter your choice: "

    if choice == "1"
      show "Here is the list of albums:"
      list_albums
    elsif choice == "2"
      show "Here is the list of artists:"
      list_artists
    end
  end

  private

  def show(message)
    @io.puts(message)
  end

  def prompt(message)
    @io.puts(message)
    @io.gets.chomp
  end

  def list_albums
    albums = @album_repository.all
    albums.each_with_index do |album, i|
      show " * #{i+1} - #{album.title}"
    end
  end

  def list_artists
    artists = @artist_repository.all
    artists.each_with_index do |artist, i|
      show " * #{i+1} - #{artist.name}"
    end
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end
