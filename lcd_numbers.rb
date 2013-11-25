class LCDDisplay
  attr_accessor :lcd_number, :lcd_size, :lcd_number_str
  def initialize(size=2,n=0)
    @lcd_number = n
    @lcd_size = 2
    @lcd_number_str = n.to_s
  end
  def number_display(num_str=lcd_number_str)
    num_str.each_char do |s|
      digit_display(s.to_i)
    end
  end
  def digit_display(num)
    case num
    when 0
      display_horizontal(@lcd_size,"-")
      display_double_bar(@lcd_size,["|","|"])
      display_horizontal(@lcd_size,"-")
    when 1
      display_horizontal(@lcd_size," ")
      display_double_bar(@lcd_size,[" ","|"])
      display_horizontal(@lcd_size," ")
    when 2
      display_horizontal(@lcd_size,"-")
      display_double_bar(@lcd_size,[" ","|"])
      display_horizontal(@lcd_size,"-")
      display_double_bar(@lcd_size,["|"," "])
      display_horizontal(@lcd_size,"-")
    when 3
      display_horizontal(@lcd_size,"-")
      display_double_bar(@lcd_size,[" ","|"])
      display_horizontal(@lcd_size,"-")
      display_double_bar(@lcd_size,[" ","|"])
      display_horizontal(@lcd_size,"-")
    when 4
      display_horizontal(@lcd_size," ")
      display_double_bar(@lcd_size,["|","|"])
      display_horizontal(@lcd_size,"-")
      display_double_bar(@lcd_size,[" ","|"])
      display_horizontal(@lcd_size," ")
    when 5
      display_horizontal(@lcd_size,"-")
      display_double_bar(@lcd_size,["|"," "])
      display_horizontal(@lcd_size,"-")
      display_double_bar(@lcd_size,[" ","|"])
      display_horizontal(@lcd_size,"-")
    when 6
      display_horizontal(@lcd_size,"-")
      display_double_bar(@lcd_size,["|"," "])
      display_horizontal(@lcd_size,"-")
      display_double_bar(@lcd_size,["|","|"])
      display_horizontal(@lcd_size,"-")
    when 7
      display_horizontal(@lcd_size,"-")
      display_double_bar(@lcd_size,[" ","|"])
      display_horizontal(@lcd_size," ")
      display_double_bar(@lcd_size,[" ","|"])
      display_horizontal(@lcd_size," ")
    when 8
      display_horizontal(@lcd_size,"-")
      display_double_bar(@lcd_size,["|","|"])
      display_horizontal(@lcd_size,"-")
      display_double_bar(@lcd_size,["|","|"])
      display_horizontal(@lcd_size,"-")
    when 9
      display_horizontal(@lcd_size,"-")
      display_double_bar(@lcd_size,["|","|"])
      display_horizontal(@lcd_size,"-")
      display_double_bar(@lcd_size,[" ","|"])
      display_horizontal(@lcd_size,"-")
    else
      puts "error in digit display"
    end
  end
  def display_horizontal(dsize,char_str="-")
    char_str = char_str * dsize
    char_str = " " + char_str + " "
    print char_str
    puts "\n"
  end
  def display_double_bar(dsize,char_str_arr=["|","|"])
    (1..dsize).each do |m|
      (1..dsize+2).each do |n|
        if (n==1)
          print char_str_arr[0]
        elsif (n==dsize+2)
          print char_str_arr[1]
        else
          print " "
        end
      end
      puts "\n"
    end
  end
  def create_lcd_digit_array(s)
    col_size = s+2
    row_size = col_size+s+1
    dig_arr = Array.new(row_size) { Array.new(col_size,"-")}
  end
  def apply_row_pattern(dig_arr,row_num,flag)
    case flag
    when "H" #horizontal
      dig_arr[row_num][0] = " "
      dig_arr[row_num][-1] = " "
    when "L" #left vertical bar only
      (0..dig_arr[row_num].length-1).each do |i|
        dig_arr[row_num][i] = " "
      end 
      dig_arr[row_num][0] = "|"
    when "R" #right vertical bar only
      (0..dig_arr[row_num].length-1).each do |i|
        dig_arr[row_num][i] = " "
      end 
      dig_arr[row_num][-1] = "|"
    when "B" #both right and left vertical
      (0..dig_arr[row_num].length-1).each do |i|
        dig_arr[row_num][i] = " "
      end 
      dig_arr[row_num][0] = "|"
      dig_arr[row_num][-1] = "|"
    end
    return dig_arr
  end
  def concatenate_digits(m_arr,n_arr)
    #put digits m,n together in one LCD array
    lcd_arr = Array.new(m_arr.size)
    (0..lcd_arr.length-1).each do |i|
      lcd_arr[i]<<m_arr[i]<<n_arr[i]
      lcd_arr[i].flatten!
    end
    lcd_arr
  end
end

lcd_d = LCDDisplay.new(ARGV[1],ARGV[2])
lcd_d.number_display
p lcd_d.create_lcd_digit_array(2)