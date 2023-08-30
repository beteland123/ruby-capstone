require_relative '../musicalbum'
require 'date'

describe MusicAlbum do
  let(:publish_date) { '04/3/2023' }
  let(:album) { MusicAlbum.new('04/3/2023') }

  describe '#initialize' do
    it 'sets the publish_date attribute' do
      expect(album.publish_date).to eq(Date.parse(publish_date))
    end

    it 'inherits archived: false from its parent' do
      expect(album.archived).to be(false)
    end

    it 'inherits on_spotify: false from its parent' do
      expect(album.on_spotify).to be(false)
    end
  end

  describe '#can_be_archived?' do
    it 'returns false when on_spotify is not true' do
      album.on_spotify = false
      expect(album.can_be_archived?).to be(false)
    end
  end
end
