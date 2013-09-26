class Parser < ActiveRecord::Base
	NAMEFILE = 'sql' # constant
	
	def initialize(options)
		@description = options[:description]
	end

	def save_to_file
		File.open("#{NAMEFILE}.html", "w") do |f|
			 f.puts "#{@data_array}" # будет записано в файл 
		end
	end
	
end
