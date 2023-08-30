class Label
  attr_accessor :title, :color
  attr_reader :item

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end
end
