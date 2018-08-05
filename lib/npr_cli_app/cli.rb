class NPRCLIApp::CLI

  def call
    # put all of the methods you make in this method
    puts "Welcome to the NPR CLI App! Get  the most current news from NPR here!"
    menu
    goodbye

  end

  def list_categories
    puts "Top Story:"
    puts "1. #{NPRCLIApp::Story.scrape_top_story.title}"
    puts "News categories:"

    NPRCLIApp::Story.all_stories.each.with_index(2){|story, i| puts "#{i}. #{story.category}"}.uniq

  end

  def add_stories
    NPRCLIApp::Story.add_stories
  end

  def menu
    input = nil
    add_stories
    list_categories
    until input == "exit"
      puts "Please enter a number that corresponds to your category choice or type \"exit\" to leave:"
      input = gets.strip.downcase
      if input == "1"
        puts "List of NPR ANALYSIS stories"
      elsif input == "2"
        puts "list of TODAY IN POLITICS stories"
      elsif input == "3"
        puts "list of TOP STORIES"
      else
        puts "Please enter a number that corresponds to your category choice:"
        list_categories
      end
    end
  end

  def goodbye
    puts "Please come back to keep up with NPR!"
  end

end
