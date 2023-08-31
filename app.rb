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

  def options
    puts 'Please enter the number of the option:'
    puts ' 1 - List all books'
    puts ' 2 - List all movies'
    puts ' 3 - List of games'
    puts ' 4 - List all genres'
    puts ' 5 - List all labels'
    puts ' 6 - List all authors'
    puts ' 7 - List all music albums'
    puts ' 8 - Add a book'
    puts ' 9 - Add a music album'
    puts '10 - Add a movie'
    puts '11 - Add a game'
    puts ' 0 - Exit'
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

  def new_musicalbum(on_spotify, genre_name, author_first_name, author_last_name, label_title, label_color, publish_date)
    musicalbum = MusicAlbum.new(publish_date, on_spotify: on_spotify)
    
    genre = Genre.new(genre_name)
    author = Author.new(author_first_name, author_last_name)
    label = Label.new(label_title, label_color)
    
    musicalbum.genre = genre
    musicalbum.author = author
    musicalbum.label = label

    @musicalbums << musicalbum
    @items << musicalbum

    puts 'Music Album created !!!'
    puts
  end

  def list_musicalbums
    if @musicalbums.empty?
      puts 'No Music albums available'
    else
      musicalbum_counter = 1
      @musicalbums.each do |musicalbum|
        puts
        puts "Music Album # #{musicalbum_counter}"
        puts "on_spotify: #{musicalbum.on_spotify}"
        puts "Genre: #{musicalbum.genre.name}"
        puts "Author: #{musicalbum.author.first_name} #{musicalbum.author.last_name}"
        puts "Label: #{musicalbum.label.title} (#{musicalbum.label.color})"
        puts "Publish Date: #{musicalbum.publish_date}"
        puts
        musicalbum_counter += 1
      end
    end
  end

end
