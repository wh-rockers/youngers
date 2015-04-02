require 'open-uri'
module Crawlers
  module StartUps
    class GuangguCoffee
      def self.scrape_list
        base_url = "http://121.42.46.46"
        (1..11).each do |page|
          url = "http://121.42.46.46/m/ListPage/#{page}/"
          list = JSON.load open(url)
          list.fetch('project_list').each do |s|
            next if StartUp.exists?(name: s.fetch('title'))
            start_up = StartUp.create({
              logo_url: "#{base_url}/media/#{s.fetch('image')}",
              name: s.fetch('title'),
              from_url: "#{base_url}/project/#{s.fetch('id')}"
              })
            p "#{start_up.name} -- #{start_up.logo_url}"
          end
        end
      end

      def self.scrape_details
        StartUp.find_each do |s|
          next unless s.from_url.present?
          page = GuangguCoffeePage.new(s)
          s.update_attributes(link: page.link, desc: page.desc)
        end
      end

      class GuangguCoffeePage
        attr_reader :page, :full_text
        def initialize(start_up)
          @page = Nokogiri::HTML open(start_up.from_url)
          @full_text = @page.text()
        end

        def link
          full_text.match(/【项目链接】[^【]*/).to_s.tr("【项目链接】",'').strip
        end

        def desc
          full_text.match(/【公司介绍】[^【]*/).to_s.tr("【公司介绍】",'').strip
        end
      end
    end
  end
end