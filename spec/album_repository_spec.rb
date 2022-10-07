require 'album_repository'

RSpec.describe AlbumRepository do
  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_albums_table
  end

  it "lists all the albums" do
    repo = AlbumRepository.new

    albums = repo.all
    expect(albums.length).to eq 4
  end

  it "returns the id 1" do
    repo = AlbumRepository.new

    albums = repo.all
    expect(albums.first.id).to eq '1'
  end

  it "returns the title 'Harrys House'" do
    repo = AlbumRepository.new

    albums = repo.all
    expect(albums.first.title).to eq "Harrys House"
  end

  it "find a single album" do
    repo = AlbumRepository.new

    album = repo.find(1)
    expect(album.title).to eq "Harrys House"
    expect(album.release_year).to eq "2022"
    expect(album.artist_id).to eq "1"
  end

  it "find a single album" do
    repo = AlbumRepository.new

    album = repo.find(3)
    expect(album.title).to eq "Red"
    expect(album.release_year).to eq "2012"
    expect(album.artist_id).to eq "2"
  end

  it "add an album" do
    repo = AlbumRepository.new

    album = Album.new
    album.title = 'Midnights'
    album.release_year = '2022'
    album.artist_id = '2'

    repo.create(album)

    albums = repo.all
    expect(albums).to include(
      have_attributes(
        title: album.title,
        release_year: album.release_year,
        artist_id: album.artist_id)
      )
  end
end
