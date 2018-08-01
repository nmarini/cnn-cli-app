

class CNNCLIApp::Story
  attr_accessor :title, :author, :description, :category

  @@stories = []

  def self.scrape_analysis
    doc = Nokogiri::HTML(open("https://www.cnn.com/?refresh=1"))

    story = self.new
    story.title = doc.search
    story.author =
    story.description =
    story.category =
  end

end
