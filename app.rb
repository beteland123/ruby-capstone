require 'json'
require_relative 'book'
require_relative 'item'
require_relative 'label'
require_relative 'musicalbum'
require_relative 'genre'
require_relative 'author'
require_relative 'game'
require_relative 'menu'

class App
  attr_accessor :books, :items, :musicalbums, :genres, :authors, :labels
  def options
    Menu.options
  end

  def all_books
    book_counter = 1
    data = read_file('book.json')
    if data.nil?
      puts 'No books available'
    else
      data.each do |book|      
        puts "#{book_counter}.
        publisher: \"#{book['Publisher']}\",
        cover_state: #{book['cover_state']} ,
        publish_date: #{book['publisher_date']}
        Genre: #{book['genre']}
        Author_First_Name: #{book['author_firstname']}
        Author_Last_Name: #{book['author_lasttname']}
        Label_Title: #{book['label_title']}
        Label_Color: #{book['label_color']}"
        book_counter += 1
      end;nil
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
    book_data = {
      'Publisher' => book.publisher,
      'cover_state' => book.cover_state,
      'publisher_date' => book.publish_date,
      'genre' => book.genre.name ,
      'label_title'=>  book.label.title,
      'label_color'=>  book.label.color,
      'author_firstname'=> book.author.first_name,
      'author_lasttname'=> book.author.last_name
    }
    write_file('book.json', book_data)
    label_writer(label)
    genre_writer(genre)
    author_writer(author)
    puts 'Book created successfully'
    puts
  end

  
  def all_labels
    counter = 1
    data = read_file('label.json')
    if data.empty?
      puts 'No items avaliable'
    else
      data.each do |label|
        puts "#{counter}   \"#{label['title']}\",\"#{label['color']}\" "
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

  def new_game(multiplayer, last_played_at, data)
    game = Game.new(data[5], multiplayer, last_played_at)

    genre = Genre.new(data[0])
    author = Author.new(data[1], data[2])
    label = Label.new(data[3], data[4])

    game.genre = genre
    game.author = author
    game.label = label

    @games << game
    @items << game
    @authors << author
    @labels << label
    @genres << genre

    puts 'Game created successfully'
    puts
  end

  def list_games
    if @games.empty?
      puts 'No games available'
    else
      game_counter = 1
      @games.each do |game|
        puts
        puts "Game # #{game_counter}"
        puts "Multiplayer: #{game.multiplayer ? 'Yes' : 'No'}"
        puts "Last Played Date (DD/MM/YY): #{game.last_played_at}"
        puts "Genre: #{game.genre.name}"
        puts "Author: #{game.author.first_name} #{game.author.last_name}"
        puts "Label: #{game.label.title} (#{game.label.color})"
        puts "Publish Date (DD/MM/YY): #{game.publish_date}"

        puts
        game_counter += 1
      end; nil
    end
  end

  def all_authors
    if @authors.empty?
      puts 'No authors available'
    else
      all_authors = @authors.map { |author| "#{author.first_name} #{author.last_name}" }
      all_authors.uniq.each_with_index do |author, index|
        puts "#{index + 1}. #{author}"
      end; nil
    end
  end
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
