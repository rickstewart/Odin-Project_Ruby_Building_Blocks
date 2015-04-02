class CaesarCipher

  def self.process_cipher(orders, offset)
    @char_array_clear_text = orders.scan(/./)
    @char_array_encrypted_text = []
    @char_array_clear_text.each do |char|
      ascii_clear_text = char.ord
      if ascii_clear_text > 64 && ascii_clear_text < 91
        is_caps = true
        ascii_encrypted = ascii_clear_text + offset.to_i
      elsif ascii_clear_text > 96 && ascii_clear_text < 123
        is_caps = false
        ascii_encrypted = ascii_clear_text + offset.to_i
      else
        ascii_encrypted = ascii_clear_text
      end
      if ascii_encrypted > 90 && ascii_encrypted < 97
        ascii_encrypted += 7
      elsif ascii_encrypted > 122
        ascii_encrypted = (ascii_encrypted % 122) + 63
      end
      ascii_encrypted = ascii_encrypted.chr
      ascii_encrypted.downcase
      if is_caps
        ascii_encrypted.upcase
      end
      @char_array_encrypted_text << ascii_encrypted
    end
  end

  more_orders = true
  while more_orders
    not_yes_no = true
    puts "All Hail Caesar! Caesar, what are your orders for the troops?"
    orders = gets.chomp
    puts "Caesar, what offset shall we use for the cipher?"
    offset = gets.chomp
    process_cipher(orders, offset)
    puts @char_array_clear_text.join
    puts @char_array_encrypted_text.join
    while not_yes_no
      puts "Caesar, do you have further orders? yes/no"
      more = gets.downcase.chomp
      if more == "yes"
        break
      elsif more == "no"
        more_orders = false
        break
      else
        puts "Caesar, you must answer yes or no..."
      end
    end
  end
  puts "Sire, by your leave"
end
