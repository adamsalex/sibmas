class ParserController < ApplicationController
  # подключаем Nokogiri
  require 'nokogiri'
  # для получения контента через http
  require 'open-uri'

  require_relative 'constant_txt' 

  def masumaParsing
    url = "http://www.masuma.ru/masuma_max.php?q=ru-001"
  	page = Nokogiri::HTML(open(url))   
  	page.encoding = 'utf-8'

   	@data_array = Array.new
       
    i = 0
      page.css("#html").each do |item|
        while i < 5 
            firm = item.css(".firm")[i]
            frame = item.css(".frame")[i]
            engine = item.css(".engine")[i]
            year = item.css(".year")[i]
            info = item.css(".info")[i]
            
            @data_array[i] = firm.to_s + frame.to_s + engine.to_s + year.to_s + info.to_s
            i += 1    
        end
      end   
            # @items = Parser.new(description: @data_array) 
           # render text: "#{item}"
            # @items.save_to_file
          save_to_file
  end

  def save_to_file
    File.open("#{NAMEFILE}.html", "w") do |f|
      f.puts "#{HEADER}#{HEADER_TABLE}#{@data_array}#{FOOTER}" # будет записано в файл 
    end
  end          


end