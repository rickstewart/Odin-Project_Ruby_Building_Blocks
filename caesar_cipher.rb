class CaesarCipher

  def self.process_cipher(orders, offset)
    puts "orders: #{orders}, offset: #{offset}"
    @char_array_clear_text = orders.scan(/./)
    @char_array_encrypted_text = []
    @char_array_clear_text.each do |char|
      ascii = char.ord.to_i
      ascii_encryped = ascii + offset
      if ascii > 64 && ascii < 91
        is_caps = true
      else
        is_caps = false
      end
      if ascii_encryped > 90 && ascii_encryped < 97
        ascii_encryped += 7
      elsif ascii_encryped > 122
        ascii_encryped = (ascii_encryped % 122) + 64
      end
      ascii_encryped = ascii_encryped.chr
      if is_caps
        ascii_encryped.upcase
      end
      @char_array_encrypted_text << ascii_encryped
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
end
