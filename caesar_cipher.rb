class CaesarCipher

  def self.process_cipher(orders, offset)
    @char_array_clear_text = orders.scan(/./)
    @char_array_encrypted_text = []
    @char_array_clear_text.each do |char|
      @is_caps = false
      @found_letter = false
      clear_text = char.ord
      if clear_text.between? 65, 90
        @is_caps = true
        @found_letter = true
        encrypted_text = clear_text + offset.to_i
      elsif clear_text.between? 97, 122
        @is_caps = false
        @found_letter = true
        encrypted_text = clear_text + offset.to_i
      else
        encrypted_text = clear_text
        @found_letter = false
      end
      if (encrypted_text > 90) && @found_letter && @is_caps
        encrypted_text += 6
      end
      if encrypted_text > 122 && @found_letter
        encrypted_text = (encrypted_text % 122) + 64
      end
      encrypted_text = encrypted_text.chr
      encrypted_text = encrypted_text.downcase
      if @is_caps
        encrypted_text = encrypted_text.upcase
      end
      @char_array_encrypted_text << encrypted_text
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
  puts "By your leave Caesar"
end
