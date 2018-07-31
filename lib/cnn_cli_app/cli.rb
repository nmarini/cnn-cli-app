class CNNCLIApp::CLI

  def call
    # put all of the methods you make in this method
    puts "Welcome to the CNN CLI App!"
    menu

  end

  def categories
    puts "News Story Categories"
    puts <<-DOC
    1. CNN ANALYSIS
    2. TODAY IN POLITICS
    3. TOP STORIES
    DOC
  end

  def menu
    input = nil
    until input == "exit"
      categories
      puts "Please enter a number that corresponds to your category choice:"
      input = gets.strip.downcase
      if input == "1"
        puts "list of CNN ANALYSIS stories"
      elsif input == "2"
        puts "list of TODAY IN POLITICS stories"
      elsif input == "3"
        puts "list of TOP STORIES"
      else
        puts "Please enter a number that corresponds to your category choice:"
      end
    end
  end

end
