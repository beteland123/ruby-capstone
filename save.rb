class Save
  def genre_writer(genre)
    data = {
      'name' => genre.name
    }
    write_file('genre.json', data)
  end

  def label_writer(label)
    data = {
      'title' => label.title,
      'color' => label.color
    }
    write_file('label.json', data)
  end

  def author_writer(author)
    data = {
      'first_name' => author.first_name,
      'last_name' => author.last_name
    }
    write_file('author.json', data)
  end

  def write_file(fil_name, new_data_item)
    data = read_file(fil_name)
    data << new_data_item if data

    begin
      File.write(fil_name, data.to_json)
    rescue StandardError => e
      puts "Error writing file: #{e}"
    end
  end

  def read_file(filename)
    unless File.exist?(filename)
      File.open(filename, 'a')
      return []
    end

    data = File.read(filename)
    JSON.parse(data) unless data.empty?
  end
end
