class ParserController < ApplicationController
  # подключаем Nokogiri
  require 'nokogiri'
  # для получения контента через http
  require 'open-uri'

  require'constant_txt' # /lib/constant_txt.rb

  def masumaParsing
    url = "http://www.masuma.ru/masuma_max.php?q=ru-001"
  	page = Nokogiri::HTML(open(url)) 

  	page.encoding = 'utf-8'

   	@data_array = Array.new
       
    i = 0
      page.css("#html").each do |item|
        while i < item.css(".firm").length  
            firm = "<tr><td class='nbl firm'>"  + item.css(".firm")[i].text + "</td>"
            frame = "<td class='frame'>"        + item.css(".frame")[i].text + "</td>"
            engine = "<td class='engine'>"      + item.css(".engine")[i].text + "</td>"
            year = "<td class='year'>"          + item.css(".year")[i].text + "</td>"
            info = "<td class='info'>"          + item.css("td:nth-child(5)")[i].text + "</td>"
            info_ex = "<td class='info'>"          + item.css("td:nth-child(7)")[i].text + "</td></tr>"

            @data_array[i] = firm + frame + engine + year + info + info_ex

            i += 1    
        end
      end   
            # @items = Parser.new(description: @data_array) 
           # render text: "#{item}"
            # @items.save_to_file
          save_to_file
  end

  def save_to_file
    data_str = @data_array.join(" ")
    File.open("#{NAMEFILE}.html", "w") do |f|
      f.puts "#{HEADER}#{HEADER_TABLE}#{data_str}#{FOOTER}" # будет записано в файл 
    end
  end          


end