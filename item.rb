class Item
  attr_accessor :genere, :author, :source, :label

  def intilize(publish_date, archieved)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archieved = archieved
  end
end
