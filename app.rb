require_relative 'book'
require_relative 'item'
require_relative 'label'
require_relative 'musicalbum'
require_relative 'genre'
require_relative 'author'
require_relative 'book'

class App
  def initialize
    @books = []
    @items = []
    @musicalbums = []
    @genres = []
    @authors =[]
    @labels = []
    @date = []
  end

  def item_info(genre_name, author_first_name, author_last_name, label_title, label_color, publish_date)
    genre = Genre.new(genre_name)
    author = Author.new(author_first_name, author_last_name)
    label = Label.new(label_title, label_color)
    item = Item.new(publish_date)
    
    @genres << genre
    @authors << author 
    @labels << label
    @items << genre
    @items << author
    @items << label
    @date << publish_date



  end
  
  def all_books
    book_counter = 1
    if @books.empty?
      puts 'No books avaliable'
    else
      @books.each do |book|
        puts "#{book_counter}.
        publisher: \"#{book.publisher}\",
        cover_state: #{book.cover_state} ,
        publish_date: #{book.publish_date}"
        book_counter += 1
      end; nil
    end
  end

  def new_book(publisher, cover_state, publish_date, label_title, label_color)
    label = Label.new(label_title, label_color)
    book = Book.new(publisher, cover_state, publish_date)
    book.label = label

    @books << book
    @items << book

    puts 'Book created successfully'
    puts
  end

  def all_labels
    counter = 1
    if @items.empty?
      puts 'No items avaliable'
    else
      @items.each do |p|
        puts "#{counter}   \"#{p.label.title}\",\"#{p.label.color}\" "
        counter += 1
      end; nil
    end
  end

  def new_musicalbum(on_spotify)
    date = @date[0]
    musicalbum = MusicAlbum.new(date, on_spotify: on_spotify)
        @musicalbums << musicalbum
        @items << musicalbum
    puts
    puts 'Music Album created !!!'
    puts
  end

  def list_musicalbums
    musicalbum_counter = 1
    if @musicalbums.empty?
      puts 'No Music albums avaliable'
    else
      @items.each do |items|
        puts "#{musicalbum_counter}.
        on_spotify: \"#{items.musicalbum.on_spotify}\",
        genre: #{items.genre_name},
        publish_date: #{items.publish_date}"
        book_counter += 1
      end; nil
    end
  end


end
