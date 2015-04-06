class Substrings

  def substrings(words_to_be_searched, dictionary)
    @results = Hash.new
    word_array = words_to_be_searched.split(" ")
    word_array.each do |word|
      dictionary.each do |substring|
        if @results.include? substring do
          value = @results[substring]
          @results.merge! (substring value + 1)
          end
        else
          @results.store(substring, 1)
        end
      end
    end
    puts @results
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
tests = Substrings.new
tests.substrings("below", dictionary)
