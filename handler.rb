require_relative 'app'
class HandleMenu
  def initialize
    @app = App.new
  end
 
  def get_item_info
    print 'Enter Genre: '
    genre = gets.chomp
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
    @app.item_info(genre, author_first_name, author_last_name, label_title, label_color, publish_date)
  end

  def create_book
    print 'Enter publisher of the book: '
    publisher = gets.chomp
    print 'cover_state: '
    cover_state = gets.chomp
    print 'publish_date in DD/MM/YY format: '
    publish_date = gets.chomp
    print 'Label title : '
    label_title = gets.chomp
    print 'Label Color: '
    label_color = gets.chomp
    @app.new_book(publisher, cover_state, publish_date, label_title, label_color)
  end

  def all_books
    @app.all_books
  end

  def all_labels
    @app.all_labels
  end

  def create_musicalbum
    get_item_info
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
    @app.new_musicalbum(on_spotify)
  end

  def  list_musicalbums
    @app.list_musicalbums
  end
end
