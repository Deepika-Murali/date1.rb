require 'date'
def validate_date(str,dt_format)
  return Date.strptime(str, dt_format) !=nil rescue false 
end

def extract_date(str)
  puts str
  dt = nil
  str = str.gsub("-","/").gsub(":","/").gsub(" ","/").gsub("'","/").gsub(",","/").gsub("//","/")
  puts str
  
  if validate_date(str,"%m/%d/%Y")
    dt = Date.strptime(str,"%m/%d/%Y")

    puts "datemm/dd"
    puts dt
  elsif validate_date(str,"%d/%m/%Y")
    puts "datedd/mm"
    puts dt
    dt = Date.strptime(str,"%d/%m/%Y")
    puts dt
  elsif validate_date(str,"%Y/%m/%d")
    dt = Date.strptime(str,"%Y/%m/%d")        
  elsif validate_date(str,"%B/%d/%Y")
    dt = Date.strptime(str,"%B/%d/%Y")        
  elsif validate_date(str,"%d/%B/%Y")
    dt = Date.strptime(str,"%d/%B/%Y")        
  elsif validate_date(str,"%d/%b%Y")
    dt = Date.strptime(str,"%d/%b/%Y")
  elsif validate_date(str,"%b/%d/%Y")
    dt = Date.strptime(str,"%b/%d/%Y")                
  elsif validate_date(str,"%b%Y/%d")
    dt = Date.strptime(str,"%b%Y/%d")                
  elsif validate_date(str,"%b%Y")
    dt = Date.strptime(str,"%b%Y")                
  end
  
  if(dt.to_s.start_with?("00"))
    dt = Date.strptime(dt.to_s.sub("00","20"),"%Y-%m-%d")
  end

   dt = dt.to_s.gsub("-0","-")

   puts "date"
   puts dt
end
  
puts("enter a date")
str = $stdin.gets.chomp
extract_date(str)


