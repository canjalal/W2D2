class GuessingGame

    attr_reader :num_attempts

    def initialize(minnum, maxnum)
        @secret_num = rand(minnum..maxnum)
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        @game_over = true if num == @secret_num

        if(@game_over)
            puts "you win"
        elsif(num > @secret_num)
            puts "too big"
        else
            puts "too small"
        end
    end

    def ask_user
        puts "enter a number"
        guess = gets.chomp.to_i
        self.check_num(guess)
    end

end
