class CNNCLIApp::CLI

  def call
    # put all of the methods you make in this method
    puts "Welcome to the CNN CLI App!"
    menu

  end

  def menu
    puts "Please choose which category to view.  Choose 1, 2, or 3:"
    puts <<-DOC
    1. CNN ANALYSIS
    2. TODAY IN POLITICS
    3. TOP STORIES
    DOC
  end

end
