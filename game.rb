require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at, archived: false)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @archived = archived
  end

  def archive
    @archived = true
  end

  def can_be_archived?
    archived = super
    current_year = Time.now.year

    return true if archived && (current_year - @last_played_at.year > 2)

    false
  end
end
