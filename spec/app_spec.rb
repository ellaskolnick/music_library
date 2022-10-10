require './app'

RSpec.describe Application do
  it "lists albums" do
    io = double(:io)
    album = double(:album, title: "Doolittle")
    album2 = double(:album, title: "Surfer Rosa")
    album3 = double(:album, title: "Waterloo")
    albums = [album, album2, album3]
    album_repository = double(:album_repository, all: albums)
    artist = double(:artist, name: "Pixies")
    artist2 = double(:artist, name: "ABBA")
    artist3 = double(:artist, name: "Taylor Swift")
    artists = [artist, artist2, artist3]
    artist_repository = double(:artist_repository, all: artists)
    app = Application.new('music_library_test', io, album_repository, artist_repository)
    expect(io).to receive(:puts).with("Welcome to the music library manager!")
    expect(io).to receive(:puts).with("What would you like to do?")
    expect(io).to receive(:puts).with(" 1 - List all albums")
    expect(io).to receive(:puts).with(" 2 - List all artists")
    expect(io).to receive(:puts).with("Enter your choice: ")
    expect(io).to receive(:gets).and_return("1\n")
    expect(io).to receive(:puts).with("Here is the list of albums:")
    expect(io).to receive(:puts).with(" * 1 - Doolittle")
    expect(io).to receive(:puts).with(" * 2 - Surfer Rosa")
    expect(io).to receive(:puts).with(" * 3 - Waterloo")
    app.run
  end
end
