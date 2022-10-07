require_relative '../lib/album.rb'

class AlbumRepository

  # Selecting all records
  # No arguments
  def all
    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])
    # Executes the SQL query:
    # SELECT id, name, genre FROM artists;
    albums = []
    # Returns an array of Artist objects.
    result_set.each do |record|
      album = Album.new
      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']
      albums << album
    end

    albums
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    sql = 'SELECT * FROM albums WHERE id = $1;'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]

    album = Album.new
    album.id = record['id']
    album.title = record['title']
    album.release_year = record['release_year']
    album.artist_id = record['artist_id']


    return album
  end

  # Add more methods below for each operation you'd like to implement.

  def create(album)
    sql = 'INSERT INTO albums (title, release_year, artist_id) VALUES($1, $2, $3);'
    sql_params = [album.title, album.release_year, album.artist_id]

    DatabaseConnection.exec_params(sql, sql_params)
  end

  # def update(student)
  # end

  # def delete(student)
  # end
end