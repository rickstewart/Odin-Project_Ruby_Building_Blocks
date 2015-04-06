class Substrings
  @dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
  @results = Hash.new

  def substrings(words_to_be_searched, dictionary)
    word_array = words_to_be_searched.split(" ")
    word_array.each do |word|
      @dictionary.each do |substring|
        if word.include? substring
          value = @results[substring]
          @results.merge! (substring value + 1)
        else
          @results.store(substring, 1)
        end
      end
    end
  end
end

tests = Substrings.new
tests.substrings("below", @dictionary)
