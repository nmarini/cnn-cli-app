class NPRCLIApp::CLI

  @@categories = []


  def call
    puts "Welcome to the NPR CLI App! Get the most up-to-date news here from NPR!"
    puts "-----------"
    top_story
    puts "-----------"
    puts "Here is a list of News Categories:"
    category_menu
    goodbye

  end

  def top_story
    puts "NPR's Top Story:"
  NPRCLIApp::Story.scrape_top_story.tap{|top_story| puts "#{top_story.title}"}

  end

  def list_categories
   NPRCLIApp::Story.scrape_featured.each{|story| @@categories << story.category.downcase}
   @@categories.uniq.each.with_index(1){|category, i| puts "#{i}. #{category.upcase}"}
  end

  def instructions
    puts "ENTER:"
    puts "- \"LIST\" to review the list of categories"
    puts "- \"The NAME of the CATEGORY\" to view stories related to that category"
    puts "- \"top story\" to view NPR's Top Story"
    puts "- \"instructions\" to review these instructions again"
    puts "- \"exit\" to leave"

  end

  def category_menu
    input = nil
    list_categories
    instructions
    until input == "exit"
      input = gets.strip.downcase

      if @@categories.include?(input) 
        i = 1
        NPRCLIApp::Story.scrape_featured.each do |story|
          if story.category.downcase == input
            puts "#{i}. #{story.category}: #{story.title}"
            puts "Teaser: #{story.teaser}"
            puts "Link: #{story.link}"
            puts "-------------"
            i += 1
          end
        end

      elsif input == "top story"
        title = NPRCLIApp::Story.scrape_top_story.title
        category = NPRCLIApp::Story.scrape_top_story.category
        teaser = NPRCLIApp::Story.scrape_top_story.teaser
        link = NPRCLIApp::Story.scrape_top_story.link
        puts "TOP STORY: #{category}: #{title}"
        puts "------"
        puts "Story: #{teaser}"
        puts "------"
        puts "Link: #{link}"

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
