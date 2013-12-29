class Polygon
  @@sides = 10

  def self.sides
    @@sides
  end
end

class Triangle < Polygon
  @@sides = 3
end

class Rectangle < Polygon
  @@sides = 4
  # When you change a class variable, you change it for the class and its superclass.
end

puts "Polygon.sides = #{Polygon.sides}"
puts "Triangle.sides = #{Triangle.sides}"
puts "Rectangle.sides = #{Rectangle.sides}"


