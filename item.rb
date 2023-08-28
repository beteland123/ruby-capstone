class Item
  attr_accessor :genre, :author, :source, :label

  def intilize(publish_date, archived)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    current_year = Time.now.year
    
    if current_year - @publish_date.year > 10
      true
    else
      false
    end
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
    end
  end
end
