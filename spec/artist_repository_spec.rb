require 'artist_repository'

RSpec.describe ArtistRepository do

  def reset_artists_table
    seed_sql = File.read('spec/seeds_artists.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_artists_table
  end

  it "checks gives all artists" do
    repo = ArtistRepository.new

    artists = repo.all
    expect(artists.length).to eq 4
  end

  it "checks returns the id 1" do
    repo = ArtistRepository.new

    artists = repo.all
    expect(artists.first.id).to eq '1'
  end

  it "checks returns the name 'Harry Styles'" do
    repo = ArtistRepository.new

    artists = repo.all
    expect(artists.first.name).to eq "Harry Styles"
  end
end
