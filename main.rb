require_relative 'handler'
def main
  handle = HandleMenu.new
  puts
  puts 'Catalog of My Things!!!'
  puts

  loop do
    puts 'Please enter the number of the option:'
    puts ' 1 - List all books'
    puts ' 2 - List all movies'
    puts ' 3 - List of games'
    puts ' 4 - List all genres'
    puts ' 5 - List all labels'
    puts ' 6 - List all authors'
    puts ' 7 - List all sources'
    puts ' 8 - Add a book'
    puts ' 9 - Add a music album'
    puts '10 - Add a movie'
    puts '11 - Add a game'
    puts ' 0 - Exit'
    input = gets.chomp
    case input
    when '1'
      puts handle.all_books
    when '2'
      puts 'No movies available yet'
    when '3'
      puts 'No games available yet'
    when '4'
      puts 'No genres available yet'
    when '5'
      puts handle.all_labels
    when '6'
      puts 'No authors available yet'
    when '7'
      puts 'No sources available yet'
    when '8'
      puts handle.create_book
    when '9'
      print 'Enter title of the album: '
      puts 'Enter artist: '
    when '10'
      puts 'Enter title of the movie: '
    when '11'
      puts 'Enter title of the game: '
    when '0'
      puts 'Goodbye!!!'
      exit
    else
      puts 'Invalid input'
    end
  end
end

main
