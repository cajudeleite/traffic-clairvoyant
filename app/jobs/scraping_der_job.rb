require 'open-uri'
require 'nokogiri'
class ScrapingDerJob < ApplicationJob
  queue_as :default
  def perform
    url = "http://www.der.sp.gov.br/WebSite/Index.aspx"

    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search('#divCondicoes').each do |element|
      p element.text
    end
  end
end
