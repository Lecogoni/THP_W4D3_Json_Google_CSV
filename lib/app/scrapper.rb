
require 'pp'
require "pry"


#---------------- fetches email adresses


class Scrap_Town

    def get_cities_url

        a = []

        # RECUP url ville val d'oise
        page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))   

        cities_link_path = page.xpath('//a[@class="lientxt"]/@href')

        # city_url = []

        cities_name_path = page.xpath('//a[@class="lientxt"]')
        #city_name = []

        cities_name_path.each do |name|
            my_hash = {}
            url_begin = "http://annuaire-des-mairies.com/"
            #city_name << name.text
            
            url = name['href']
            #city_url << url_begin + url[2..-1]

            page = Nokogiri::HTML(URI.open("#{url_begin + url}"))
            city_email = page.xpath('//html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').text

            my_hash.store(name.text, city_email)
            a << my_hash
        end
        
        return a
    end

end



#------------------fetches email adresses