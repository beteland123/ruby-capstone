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

    game_data = {
      'Multiplayer' => game.multiplayer,
      'LastPlayedAt' => game.last_played_at,
      'Genre' => game.genre.name,
      'AuthorFirstName' => game.author.first_name,
      'AuthorLastName' => game.author.last_name,
      'LabelTitle' => game.label.title,
      'LabelColor' => game.label.color,
      'publish_date' => game.publish_date
    }

    @save.write_file('game.json', game_data)
    @save.label_writer(label)
    @save.genre_writer(genre)
    @save.author_writer(author)

    puts 'Game created successfully'
    puts
  end

  def list_games
    data = @save.read_file('game.json')
    @list_app.all_games(data)
  end

  def list_authors
    data = @save.read_file('author.json')
    @list_app.all_authors(data)
  end
end
