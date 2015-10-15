class Page < ActiveRecord::Base

  def self.save_random new_url = nil
    agent = Mechanize.new

    if new_url
      page = agent.get(new_url)
    else
    page   = agent.get "https://en.wikipedia.org/"
    page   = agent.page.link_with(:text => 'Random article').click
    @links = (page.search("p").search("a")).to_a
    end
    # binding.pry
    saved_page = Page.create(
      title: page.title,
      prelude: page.search("p").first,
      #preview: page.search("p").second,
      url: page.uri
      )
  end


  # def follow_links(num)
  #   link_data = @links.map { |l| "http://www.wikipedia.org"+l.attributes["href"].value }
  #       link_data.sample(nums).each do |u|
  #         save_page url  end
  # end

end
