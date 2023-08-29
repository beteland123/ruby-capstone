class Genre
  attr_accessor :name
  attr_reader :items

  def intialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end
end
