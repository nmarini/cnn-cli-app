

class CNNCLIApp::Story
  attr_accessor :title, :author, :description, :category

  @@stories = []

  def self.scrape_analysis
    doc = Nokogiri::HTML(open("https://www.cnn.com/?refresh=1"))
binding.pry
    story = self.new
  end

end
