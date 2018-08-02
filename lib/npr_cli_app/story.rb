

class NPRCLIApp::Story
  attr_accessor :title, :category, :link

  @@stories = []

  def self.all_stories
    @@stories
  end

  def self.scrape_top
    doc = Nokogiri::HTML(open("https://www.npr.org"))
    top_story = NPRCLIApp::Story.new
    top_story.title =
    top_story.category =
    top_story.link =
  binding.pry
  end

  def self.scrape_featured
    doc = Nokogiri::HTML(open("https://www.npr.org"))



  end

end
