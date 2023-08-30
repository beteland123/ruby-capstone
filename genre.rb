class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.is_a?(Item)
    item.genre = self
    @items << item
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end
end
