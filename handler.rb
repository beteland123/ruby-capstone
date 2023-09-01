require_relative 'app'
class Handler
  def initialize
    @app = App.new
  end

  def options
    @app.options
  end

  def capture_item_info
    print 'Enter Genre: '
    genre_name = gets.chomp
    print 'Enter Author first name: '
    author_first_name = gets.chomp
    print 'Enter Author last name: '
    author_last_name = gets.chomp
    print 'Label title : '
    label_title = gets.chomp
    print 'Label Color: '
    label_color = gets.chomp
    print 'publish_date in DD/MM/YY format: '
    publish_date = gets.chomp
    [genre_name, author_first_name, author_last_name, label_title, label_color, publish_date]
  end

  def create_book
    data = capture_item_info
    print 'Enter publisher of the book: '
    publisher = gets.chomp
    print 'cover_state: '
    cover_state = gets.chomp
    @app.new_book(publisher, cover_state, data)
  end

  def all_books
    @app.all_books
  end

  def all_labels
    @app.all_labels
  end

  def create_musicalbum
    data = capture_item_info
    print 'Is the Music Album on Spotify? [Y/N]: '
    result = gets.chomp.downcase
    if result == 'y'
      on_spotify = true
    elsif result == 'n'
      on_spotify = false
    else
      puts 'Invalid input'
      puts 'Enter a Menu option: '
    end
    @app.new_musicalbum(on_spotify, data)
  end

  def list_musicalbums
    @app.list_musicalbums
  end

  def all_genres
    @app.list_genres
  end

  def create_game
    data = capture_item_info
    print 'Is the Game multiplayer? [Y/N]: '
    result = gets.chomp.downcase
    if result == 'y'
      multiplayer = true
    elsif result == 'n'
      multiplayer = false
    else
      puts 'Invalid input'
      puts 'Enter a Menu option: '
    end
    print 'Enter the last played date (DD/MM/YY): '
    last_played_at = gets.chomp
    @app.new_game(multiplayer, last_played_at, data)
  end

  def all_games
    @app.list_games
  end

  def all_authors
    @app.list_authors
  end
end
