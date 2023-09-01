require 'json'
require_relative 'book'
require_relative 'item'
require_relative 'label'
require_relative 'musicalbum'
require_relative 'genre'
require_relative 'author'
require_relative 'game'
require_relative 'menu'
require_relative 'save'
require_relative 'list_action'

class App
  attr_accessor :books, :items, :musicalbums, :genres, :authors, :labels

  def initialize()
    @save = Save.new
    @list_app = ListAction.new
  end

  def options
    Menu.options
  end

  def all_books
    data = @save.read_file('book.json')
    @list_app.all_books(data)
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
      'publish_date' => book.publish_date,
      'genre' => book.genre.name,
      'label_title' => book.label.title,
      'label_color' => book.label.color,
      'author_firstname' => book.author.first_name,
      'author_lastname' => book.author.last_name
    }
    @save.write_file('book.json', book_data)
    @save.label_writer(label)
    @save.genre_writer(genre)
    @save.author_writer(author)
    puts 'Book created successfully'
    puts
  end

  def all_labels
    data = @save.read_file('label.json')
    @list_app.all_labels(data)
  end

  def new_musicalbum(on_spotify, data)
    musicalbum = MusicAlbum.new(data[5], on_spotify: on_spotify)

    genre = Genre.new(data[0])
    author = Author.new(data[1], data[2])
    label = Label.new(data[3], data[4])

    musicalbum.genre = genre
    musicalbum.author = author
    musicalbum.label = label

    musicalbum_data = {
      'on_spotify' => musicalbum.on_spotify,
      'publish_date' => musicalbum.publish_date,
      'genre' => musicalbum.genre.name,
      'label_title' => musicalbum.label.title,
      'label_color' => musicalbum.label.color,
      'author_firstname' => musicalbum.author.first_name,
      'author_lastname' => musicalbum.author.last_name
    }
    @save.write_file('musicalbum.json', musicalbum_data)
    @save.label_writer(label)
    @save.genre_writer(genre)
    @save.author_writer(author)

    puts 'Music Album created !!!'
    puts
  end

  def list_musicalbums
    data = @save.read_file('musicalbum.json')
    @list_app.all_musicalbums(data)
  end

  def list_genres
    data = @save.read_file('genre.json')
    @list_app.all_genres(data)
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
end
