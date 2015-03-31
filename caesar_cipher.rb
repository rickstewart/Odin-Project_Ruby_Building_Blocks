class CaesarCipher

  def self.process_cipher(orders, offset)
    puts "orders: #{orders}, offset: #{offset}"
    char_array_clear_text = orders.scan(/./)
    char_array_encrypted_text =
        char_array_clear_text.each do |char|
          char = char + offset
          
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
