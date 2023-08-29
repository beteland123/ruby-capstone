class Item
  attr_reader :genre, :author, :source, :label

  def intilize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    current_year = Time.now.year

    current_year - @publish_date.year > 10
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end
end
