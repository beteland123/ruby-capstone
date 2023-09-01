class ListAction
  def all_books(data)
    book_counter = 1
    if data.nil?
      puts 'No books available'
    else
      puts 'List of avaliable books:'
      data.each do |book|
        puts "#{book_counter}.      publisher: \"#{book['Publisher']}\",
              cover_state: #{book['cover_state']} ,
              publish_date: #{book['publisher_date']}
              Genre: #{book['genre']}
              Author_First_Name: #{book['author_firstname']}
              Author_Last_Name: #{book['author_lasttname']}
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
      puts 'List of avaliable labels:'
      data.each do |label|
        puts "#{counter}   \"#{label['title']}\",\"#{label['color']}\" "
        counter += 1
      end; nil
    end
  end
end
