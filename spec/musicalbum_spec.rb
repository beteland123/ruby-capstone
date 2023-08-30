require './musicalbum'

RSpec.describe MusicAlbum do
  describe "#can_be_archived?" do
    context "when album is old enough and on Spotify" do
      it "returns true" do
        album = MusicAlbum.new(Date.new(2005, 1, 1), on_spotify: true)
        expect(album.can_be_archived?).to eq(true)
      end
    end

    context "when album is not on Spotify" do
      it "returns false" do
        album = MusicAlbum.new(Date.new(2005, 1, 1), on_spotify: false)
        expect(album.can_be_archived?).to eq(false)
      end
    end

    context "when album is not archivable due to recent publish date" do
      it "returns false" do
        album = MusicAlbum.new(Date.new(2022, 1, 1), on_spotify: true)
        expect(album.can_be_archived?).to eq(false)
      end
    end
  end
end
