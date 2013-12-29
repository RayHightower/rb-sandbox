Thread.new {
  Thread.current[:foo] = "bar"
  Fiber.new {
    p Thread.current[:foo] # => nil
  }.resume
}.join
