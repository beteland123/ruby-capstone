require_relative 'book'
require_relative 'item'
require_relative 'label'
class App
  def initialize
    @books = []
    @items = []
  end

  def all_books
    book_counter = 1
    if @books.empty?
      puts 'No books avaliable'
    else
      @books.each do |book|
        puts "#{book_counter}. publisher: \"#{book.publisher}\", cover_state: #{book.cover_state} , publish_date: #{book.publish_date}"
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
end
