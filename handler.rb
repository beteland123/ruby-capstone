require_relative 'app'
class HandleMenu
  def initialize
    @app = App.new
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
end
