require_relative 'item'

class MusicAlbum < Item
  attr_accessor :archived, :on_spotify

  def initialize(publish_date, archived: false, on_spotify: false)
    super(publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    archived = super
    archived && @on_spotify
  end
end
