
require 'pp'
require "pry"
require 'json'


class Scrap_Town
    attr_accessor :city_array
    
    def initialize

        @city_array = []

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
            @city_array << my_hash
        end
    end

    def save_as_JSON
        File.open("db/email.json", "w+") do |f|
            f.write(JSON.pretty_generate(@city_array))
          end
    end


    #---- 


# tempHash = {
#     "key_a" => "val_a",
#     "key_b" => "val_b"
# }

#https://stackoverflow.com/questions/5507512/how-to-write-to-a-json-file-in-the-correct-format/5507535#5507535


end