class ListAction
  def all_books(data)
    book_counter = 1
    if data.nil?
      puts 'No books available'
    else
      puts
      puts 'List of available Books:'
      puts
      data.each do |book|
        puts "Book ##{book_counter}.      publisher: \"#{book['Publisher']}\",
              cover_state: #{book['cover_state']} ,
              publish_date: #{book['publish_date']}
              Genre: #{book['genre']}
              Author_First_Name: #{book['author_firstname']}
              Author_Last_Name: #{book['author_lastname']}
              Label_Title: #{book['label_title']}
              Label_Color: #{book['label_color']}"
        puts
        book_counter += 1
      end; nil
    end
  end

  def all_labels(data)
    counter = 1
    if data.empty?
      puts 'No items avaliable'
    else
      puts
      puts 'List of available Labels:'
      puts
      data.each do |label|
        puts "Label ##{counter}   \"#{label['title']}\",\"#{label['color']}\" "
        counter += 1
      end; nil
    end
  end

  def all_musicalbums(data)
    if data.empty?
      puts 'No Music albums available'
    else
      puts
      puts 'List of avaliable Music Albums:'
      musicalbum_counter = 1
      data.each do |musicalbum|
        puts
        puts "Music Album # #{musicalbum_counter}"
        puts "on_spotify: #{musicalbum['on_spotify']}"
        puts "Genre: #{musicalbum['genre']}"
        puts "Author: #{musicalbum['author_firstname']} #{musicalbum['author_lastname']}"
        puts "Label: #{musicalbum['label_title']} (#{musicalbum['label_color']})"
        puts "Publish Date: #{musicalbum['publish_date']}"
        puts
        musicalbum_counter += 1
      end; nil
    end
  end
end
