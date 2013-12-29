class Quote
  def initialize
    @str = "The quick brown fox..."
  end

  define_method :display_message do
    puts @str
  end

end

Quote.send(:define_method, :display_message) do
  puts "#{str1} #{str2}"
end
