require 'open-uri'
require 'nokogiri'
class ScrapingDerJob < ApplicationJob
  queue_as :default
  def perform
    url = "https://pt.wikipedia.org/wiki/Samba"

    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search('#firstHeading').each do |element|
      p element.value
    end
  end
end
