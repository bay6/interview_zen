class AnagramSolver
  attr_accessor :dictionary
  def initialize file_name
    words = File.readlines(file_name).collect{ |line| line.chomp.downcase }
    @dictionary = words.each_with_object(Hash.new []) do |word, hash|
      hash[word.chars.sort.join] += [word]
    end
  end
  
  def solve word
    @dictionary[word.chars.sort.join]
  end
end