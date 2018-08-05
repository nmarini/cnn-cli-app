class NPRCLIApp::CLI

  def call
    puts "Welcome to the NPR CLI App! Get the most up-to-date news here from NPR!"
    category_menu
    goodbye

  end

  def top_story
    puts "NPT's Top Story:"
  NPRCLIApp::Story.scrape_top_story.tap{|top_story| puts "#{top_story.title}"}

  end

  def list_categories
    puts "News Categories:"
   NPRCLIApp::Story.scrape_featured.each.with_index(1){|story, i| puts "#{i}. #{story.category}"}
  end

  # def add_stories
  #   NPRCLIApp::Story.add_stories
  # end

  def instructions
    puts "Please enter"
    puts "- a number that corresponds to your choice"
    puts "OR"
    puts "- type \"top story\" to view NPR's Top Story"
    puts "OR"
    puts "- type \"exit\" to leave:"
  end

  def category_menu
    input = nil
    # add_stories
    top_story
    list_categories
    until input == "exit"
    instructions
      input = gets.strip.downcase
      if input == "1"
        puts "#{NPRCLIApp::Story.scrape_featured[0].category}"
        puts "#{NPRCLIApp::Story.scrape_featured[0].title}"
        puts "#{NPRCLIApp::Story.scrape_featured[0].link}"
      elsif input == "2"
        puts "#{NPRCLIApp::Story.scrape_featured[1].category}"
        puts "#{NPRCLIApp::Story.scrape_featured[1].title}"
        puts "#{NPRCLIApp::Story.scrape_featured[1].link}"
      elsif input == "3"
        puts "#{NPRCLIApp::Story.scrape_featured[2].category}"
        puts "#{NPRCLIApp::Story.scrape_featured[2].title}"
        puts "#{NPRCLIApp::Story.scrape_featured[2].link}"

      elsif input == "top story"
        puts "#{NPRCLIApp::Story.scrape_top_story.category}"
        puts "#{NPRCLIApp::Story.scrape_top_story.title}"
        puts "#{NPRCLIApp::Story.scrape_top_story.link}"
      else
        top_story
        list_categories
        instructions
      end
    end
  end

  def goodbye
    puts "Please come back to keep up with NPR!"
  end

end
