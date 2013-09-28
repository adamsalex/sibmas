class ParserController < ApplicationController
  # подключаем Nokogiri
  require 'nokogiri'
  # для получения контента через http
  require 'open-uri'

  require'constant_txt' # /lib/constant_txt.rb

  def masumaParsing
    url = "http://www.masuma.ru/masuma_max.php?q=RU-001" 
  	page = Nokogiri::HTML(open(url)) 
  	page.encoding = 'utf-8'

   	@data_array = Array.new
    @model_array = Array.new  
    @model = Array.new

    i = 0
      page.css("#html").each do |item|
        while i < item.css(".firm").length  # вычисляем длинну таблицы
        # while i < 16
            firm_txt = item.css(".firm")[i].text 
            firm = "<tr><td class='nbl firm'>"  + firm_txt + "</td>"

            frame = "<td class='frame'>"        + item.css(".frame")[i].text + "</td>"
            engine = "<td class='engine'>"      + item.css(".engine")[i].text + "</td>"
            year = "<td class='year'>"          + item.css(".year")[i].text + "</td>"
            info = "<td class='info'>"          + item.css("td:nth-child(5)")[i].text + "</td>"
            info_ex = "<td class='info'>"          + item.css("td:nth-child(7)")[i].text + "</td></tr>"

            @model_array[i] = firm_txt # получаем массив моделей
            @data_array[i] = firm + frame + engine + year + info + info_ex

            i += 1    
        end
      end   
          model_uniq # уникализируем массив моделей для правильного представления
          save_to_file
  end

  def model_uniq
    @model_str = @model_array.uniq
    i = 0
    @model_str.each do |item|
      @txt = item.gsub(/(Япония|Европа|США)/i,"").delete("[]").strip + " |"
      @model[i] =@txt
      i+= 1 
    end
    @art = "RU-001" # не забыть удалить тестовый артикул
    @model_end = " в соответствии с фирменным каталогом Masuma - " + @art + ". С полным списком соответствия можете ознакомиться, нажав на баннер ниже."
    @model_txt = "Сайлентблок для " + @model.join(" ") + @model_end 
 
  end

  def save_to_file
    data_str = @data_array.join(" ")
    File.open("#{NAMEFILE}.html", "w") do |f|
      f.puts "#{HEADER}#{@model_txt}#{HEADER_TABLE}#{data_str}#{FOOTER}" # будет записано в файл 
    end
  end          


end