require_relative 'handler'
def main
  @handler = Handler.new
  puts
  puts 'Catalog of My Things!!!'
  puts

  loop do
    @handler.options
    input = gets.chomp
    case input
    when '1'
      puts @handler.all_books
    when '2'
      puts 'No movies available yet'
    when '3'
      puts 'No games available yet'
    when '4'
      puts 'No genres available yet'
    when '5'
      puts @handler.all_labels
    when '6'
      puts 'No authors available yet'
    when '7'
      puts @handler.list_musicalbums
    when '8'
      puts @handler.create_book
    when '9'
      puts @handler.create_musicalbum
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
