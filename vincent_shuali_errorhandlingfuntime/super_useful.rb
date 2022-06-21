# PHASE 2
def convert_to_int(str)
  Integer(str)
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError.new("Este fruto no está en la lista de frutos")
  end
end

=begin
class Exception
  initialize(message)

  @message = message

=end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp

  reaction(maybe_fruit) 

rescue StandardError => err # put the error instance into the err variable
  puts err.message

  puts "Pero lo puedes dar café (en inglés) para continuar: "

  newcontrib = gets.chomp

  retry if (newcontrib == "coffee" || newcontrib == "café")
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if(yrs_known < 5)
      raise ArgumentError.new("Todavía no nos conocemos por bastante tiempo")
    else  
      @yrs_known = yrs_known
    end

    if(name.length <= 0 || fav_pastime.length <=0)
      raise ArgumentError.new("Cómo es que piensas que podamos ser amigos sin ofrecer tal
        información?")
    else
      @name = name

      @fav_pastime = fav_pastime 

    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

# reaction("papaya")
jacqueline = BestFriend.new("Jacqueline", 6, "high-intensity zumba knitting")

begin
  neil = BestFriend.new("", 7, "")

rescue ArgumentError => err
  puts err.message

  puts "Try again. What is your name?"

  myname = gets.chomp

  puts "And what is your favorite pastime?"

  mypastime = gets.chomp

  neil = BestFriend.new(myname, 7, mypastime)

end