class NPRCLIApp::Story
  attr_accessor :title, :link, :category

  @@stories = []

  def self.add_stories
    @@stories << self.scrape_top_story

    @@stories << self.scrape_featured
  end

  def self.all_stories
    @@stories

  end

  def self.scrape_top_story
    doc = Nokogiri::HTML(open("https://www.npr.org"))
    top_story = NPRCLIApp::Story.new
    top_story.title = doc.search('h3.title').first.text
    top_story.category = doc.search('h2.slug a').first.text.strip
    top_story.link = doc.search('div.story-text a')[1].attr('href')
    top_story
  end

  def self.scrape_featured
    scrape_stories = []
    doc = Nokogiri::HTML(open("https://www.npr.org"))

    featured_stories = doc.search('section.featured-group')
    featured_stories.search('div.story-wrap').each do |article|
        story = NPRCLIApp::Story.new

        story.title = article.search('h3').text
        story.category = article.search('h2').text.strip
        story.link = article.search('a').attr('href').value
        scrape_stories << story

    end
    scrape_stories
  end

end
