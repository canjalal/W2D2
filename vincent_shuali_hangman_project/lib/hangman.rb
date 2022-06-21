class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word  
    DICTIONARY.sample() # don't use an argument, otherwise will return an array
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    newarray = []
    @secret_word.each_char.with_index {|chr, i| newarray << i if chr == char}
    newarray
  end

  def fill_indices(char, arrindices)
    arrindices.each {|ele| @guess_word[ele] = char}
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      false
    else
      @attempted_chars << char
      correctindices = get_matching_indices(char)
      if(correctindices.length > 0)
        self.fill_indices(char, correctindices)
      else 
        @remaining_incorrect_guesses -= 1
      end

      true

    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    userguess = gets.chomp
    self.try_guess(userguess)
    
  end

  def win?
    if(@guess_word.join('') == @secret_word)
      puts "WIN"
      true
    else
      false
    end
  end

  def lose?
    if(@remaining_incorrect_guesses == 0)
      puts "LOSE"
      true
    else
      false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      true
    else
      false
    end

  end
end

