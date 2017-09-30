require 'colorize'

# 
def func_math(opt1)
  score = 0
  topScore = 1
  bottomRange = 1
  topRange = 10
  scoreLevel = 10

  if opt1 == 1
    func = :+
    symbol = "plus"
  elsif opt1 == 2
    func = :-
    symbol = "minus"
  elsif opt1 == 3
    func = :*
    symbol = "times"
  elsif opt1 == 4
    func = :/
    symbol = "divided by"
  else
    func_bye
  end

  while true do
    if score == scoreLevel
      bottomRange = bottomRange + 3
      topRange = topRange + 3
      scoreLevel = scoreLevel + 10
    elsif score == 0
      bottomRange = 1
      topRange = 10
      scoreLevel = 10
    end

    num1 = bottomRange + rand(topRange)
    num2 = bottomRange + rand(topRange)

    sum1 = num1.public_send(func,num2)

    print "What is #{num1} #{symbol} #{num2}? "
    ans1 = gets.chomp
    ans1 = ans1.to_i

    if sum1 == ans1
      system("clear")
      score += 1
      if score >= topScore
        topScore = score
      end
      puts "Longest run this session #{topScore}".yellow
      print "Correct!".green
      puts " - #{score} correct answers in a row!".green
    elsif ans1 == 00
      func_bye
    else
      system("clear")
      score = 0
      puts "Longest run this session #{topScore}".yellow
      print "Incorrect".red
      puts " - #{sum1}".red
    end
  end
end
## End of toplevel function.

def func_bye
  abort("See ya!".yellow)
end

system("clear")
puts "What would you like to do? \n1-Add \n2-Subtract \n3-Multiply \n4-Divide"
choice = gets.chomp
choice = choice.to_i

if choice == 1
  system("clear")
  puts "Lets add!"
  func_math(1)
elsif choice == 2
  system("clear")
  puts "Lets subtract!"
  func_math(2)
elsif choice == 3
  system("clear")
  puts "Lets mutliply!"
  func_math(3)
elsif choice == 4
  system("clear")
  puts "Lets divide!"
  func_math(4)
else
  func_bye
end

