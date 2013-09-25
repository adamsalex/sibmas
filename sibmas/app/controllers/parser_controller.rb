class ParserController < ApplicationController
  # подключаем Nokogiri
  require 'nokogiri'

  # для получения контента через http
  require 'open-uri'

  @name_file = 'sql'

  def masumaParsing
    url = "http://www.masuma.ru/masuma_max.php?q=ru-001"
  	page = Nokogiri::HTML(open(url))   
  	page.encoding = 'utf-8'
   	
    @data_array = Array.new
   # @header_table = page.css("th.c")    
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
          File.open("#{@name_file}.html", "w") do |f|
            @items.each { |i| f.puts "#{@data_array}"} 
          end
          
          render text: "#{@data_array}"
  end

  def save_to_file
    File.open("#{@name_file}.html", "w") do |f|
      @items.each { |i| f.puts "#{@data_array}"} # будет записано в файл car:100:50
    end
  end

end