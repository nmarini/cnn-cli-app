class NPRCLIApp::CLI

  def call
    # put all of the methods you make in this method
    puts "Welcome to the NPR CLI App! Get news in technology from NPR here!"
    menu
    goodbye

  end

  def list_categories
    puts "News categories:"




  NPRCLIApp::Story.all_stories.each.with_index(1){|story, i| puts "#{i}. #{story.category}"}.uniq
  binding.pry

  end

  def menu
    input = nil
    until input == "exit"
      list_categories
      puts "Please enter a number that corresponds to your category choice or type \"exit\" to leave:"
      input = gets.strip.downcase
      if input == "1"
        puts "List of NPR ANALYSIS stories"
        # then should be able to choose a story to learn more about
      elsif input == "2"
        puts "list of TODAY IN POLITICS stories"
      elsif input == "3"
        puts "list of TOP STORIES"
      else
        puts "Please enter a number that corresponds to your category choice:"
      end
    end
  end

  def goodbye
    puts "Please come back to keep up with NPR!"
  end

end
