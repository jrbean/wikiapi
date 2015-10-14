class Page < ActiveRecord::Base

  def self.save_random
    agent = Mechanize.new

    page = agent.get "https://en.wikipedia.org/"
    page = agent.page.link_with(:text => 'Random article').click
    body_text = page.search("mw-content-text")
    results = []
    body_text.each do |para|
      p_results = para.search('p')
      results.push(p_results.text)
    end

binding.pry

    saved_page = Page.create(
    title: page.title,
    prelude: results[0],
    preview: results[1],
    url: page.uri
    )
  end


  def follow_links(num)
    #picks (num) of links
  end
end
