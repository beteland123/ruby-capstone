require_relative 'book'
require_relative 'item'
require_relative 'label'
require_relative 'musicalbum'
require_relative 'genre'
require_relative 'author'

class App
  def initialize
    @books = []
    @items = []
    @musicalbums = []
    @genres = []
    @authors = []
    @labels = []
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
        publish_date: #{book.publish_date}
        Genre: #{book.genre.name}
        Author: #{book.author.first_name} #{book.author.last_name}
        Label: #{book.label.title} (#{book.label.color})"
        book_counter += 1
      end; nil
    end
  end

  def new_book(publisher, cover_state, data)
    label = Label.new(data[3], data[4])
    book = Book.new(publisher, cover_state, data[5])
    genre = Genre.new(data[0])
    author = Author.new(data[1], data[2])
    book.label = label
    book.author = author
    book.genre = genre

    @books << book
    @items << book
    @authors << author
    @labels << label
    @genres << genre

    puts 'Book created successfully'
    puts
  end

  def all_labels
    counter = 1
    if @labels.empty?
      puts 'No items avaliable'
    else
      @labels.each do |label|
        puts "#{counter}   \"#{label.title}\",\"#{label.color}\" "
        counter += 1
      end; nil
    end
  end

  def new_musicalbum(on_spotify, data)
    musicalbum = MusicAlbum.new(data[5], on_spotify: on_spotify)

    genre = Genre.new(data[0])
    author = Author.new(data[1], data[2])
    label = Label.new(data[3], data[4])

    musicalbum.genre = genre
    musicalbum.author = author
    musicalbum.label = label

    @musicalbums << musicalbum
    @items << musicalbum
    @authors << author
    @labels << label
    @genres << genre

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
      end; nil
    end
  end

  def list_genres
    if @genres.empty?
      puts 'No genres available'
    else
      puts
      puts 'List of genres:'
      puts
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}. #{genre.name}"
      end
      puts
    end
  end
end
