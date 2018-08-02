

class NPRCLIApp::Story
  attr_accessor :title, :author, :description, :category

  @@stories = []

  def self.all_stories
    @@stories
  end

  def self.scrape_top_stories
    doc = Nokogiri::HTML(open("https://www.npr.org/sections/national/"))

    # featured news =
    #other stories =

    # story.title = doc.search()
    # story.author =
    # story.description =
    # story.category =
    binding.pry
  end

end
#homepage1-zone-1 div.l-container div div.column.zn__column--idx-1 ul h2
#//div[2]/div/div[2]/ul/h2
#doc.xpath("//div[contains(@class, 'zn__containers')]")
