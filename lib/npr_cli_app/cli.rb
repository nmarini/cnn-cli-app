class NPRCLIApp::CLI

  def call
    puts "Welcome to the NPR CLI App! Get the most up-to-date news here from NPR!"
    top_story
    category_menu
    goodbye

  end

  def top_story
  NPRCLIApp::Story.scrape_top_story.title

  end

  def list_categories

  t =  NPRCLIApp::Story.all_stories
binding.pry
  end

  def add_stories
    NPRCLIApp::Story.add_stories
  end

  def category_menu
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
      end
    end
  end

  def goodbye
    puts "Please come back to keep up with NPR!"
  end

end
