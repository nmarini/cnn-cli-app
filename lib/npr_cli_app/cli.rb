class NPRCLIApp::CLI

  @@categories = []

  def self.categories
    @@categories 
  end  
    

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
   NPRCLIApp::Story.scrape_featured.each{|story| @@categories << story.category.downcase}
   @@categories.uniq.each.with_index(1){|category, i| puts "#{i}. #{category.upcase}" if category =~ /[a-z]/i}
  end

  # def add_stories
  #   NPRCLIApp::Story.add_stories
  # end

  def instructions
    puts "ENTER:"
    puts "- \"LIST\"  to review the list of categories"
    puts "- The name of the category to view it's stories"
    
    # a number that corresponds to your choice"
    # puts "OR"
    puts "- type \"top story\" to view NPR's Top Story"
    puts "OR"
    puts "- tpe \"list\" to review the list of categories"
    puts "OR"
    puts "- type \"exit\" to leave:"
    
  end

  def category_menu
    input = nil
    # add_stories
    list_categories
    instructions
    until input == "exit"
      input = gets.strip.downcase
      
      if @@categories.include?(input)
        i = 1
        NPRCLIApp::Story.scrape_featured.each do |story| 
          if story.category.downcase == input
            puts "#{i}. #{category}: #{story.title}"
            puts "Teaser: #{story.teaser}"
            puts "Link: #{story.link}"
            puts "-------------"
            i += 1
          end
        end 
      #   puts "#{NPRCLIApp::Story.scrape_featured[].category}"
      #   puts "#{NPRCLIApp::Story.scrape_featured[0].title}"
      #   puts "#{NPRCLIApp::Story.scrape_featured[0].link}"
      # elsif input == "2"
      #   puts "#{NPRCLIApp::Story.scrape_featured[1].category}"
      #   puts "#{NPRCLIApp::Story.scrape_featured[1].title}"
      #   puts "#{NPRCLIApp::Story.scrape_featured[1].link}"
      # elsif input == "3"
      #   puts "#{NPRCLIApp::Story.scrape_featured[2].category}"
      #   puts "#{NPRCLIApp::Story.scrape_featured[2].title}"
      #   puts "#{NPRCLIApp::Story.scrape_featured[2].link}"

      elsif input == "top story"
        puts "#{NPRCLIApp::Story.scrape_top_story.title}"
        puts "#{NPRCLIApp::Story.scrape_top_story.category}"
        puts "#{NPRCLIApp::Story.scrape_top_story.teaser}"
        puts "#{NPRCLIApp::Story.scrape_top_story.link}"
        

      elsif input == "list"
        list_categories
      else
        instructions
      
      end
    end
  end

  def goodbye
    puts "Please come back to keep up with NPR!"
  end

end