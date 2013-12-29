# Author: John Yerhot <john@yerhot.org>
#         Michael Wagner
#  9/19/2009
require "set"
require "rspec"

class World
  attr_accessor :cells
  
  def initialize( cells )
    @cells = cells
  end
  
  def neighbors(cell)
    x, y = cell
    neighbors = Set.new
    ((x-1)..(x+1)).each do |xaxis|
      ((y-1)..(y+1)).each do |yaxis|
        neighbors << [xaxis, yaxis]
      end
    end
    neighbors.delete(cell)
    neighbors.intersection(@cells).count

  end
  
  def alive?(cell)
    if @cells.include?(cell)      
      count = neighbors(cell)
      count == 2 || count == 3
    else
      count = neighbors(cell)
      count == 3
    end
  end

  def get_neighbors(coordinates)
    all_cells = Set.new
    x, y = coordinates
    ((x-1)..(x+1)).each do |xaxis|
      ((y-1)..(y+1)).each do |yaxis|
        all_cells << [xaxis, yaxis]
      end
    end
    all_cells
    #all_cells.each {|x| puts x.inspect }
  end

  def tick
    new_cells = Set.new
    
    @cells.each do |cell|
      get_neighbors(cell).each do |n|
        new_cells << n if alive?(n)
        new_cells << cell if alive?(cell)
      end
    end    
    @cells = new_cells
  end
  
  def print_to_screen
    min = 100
    max = 0
    
    @cells.each do |x,y|
      x <= min ? min = x : nil
      y <= min ? min = y : nil
      x >= max ? max = x : nil
      y >= max ? max = y : nil
    end
    
    grid = Array.new
    
    (min..max).each do |num|
      (min..max).each do |num2|
        grid << [num, num2]
      end
    end
    length = 0
    @cells.each do |x, y|
      length < x ? length = x : nil
    end
    save_x = nil
    out = ""
    
    grid.sort.each do |x, y|
      out += "\n" unless save_x == x
      if @cells.include?([x, y])
        out += "X"
      else
        out += "-"
      end
      save_x = x      
    end
    puts out
  end
end


describe "World" do
  
  it "should take coordinates of alive cells" do
    cells = Set.new [[1, 0], [1, 1], [1, 2]]
    world = World.new cells
    world.should_not be_nil
  end
  

  it "should return neighbor count for coordinate" do
    cells = Set.new [[1, 0], [1, 1], [1, 2]]
    world = World.new cells
    world.neighbors( [1,2] ).should == 1
    world.neighbors( [1,1] ).should == 2
    world.neighbors( [2,1] ).should == 3
  end

  it "should be alive if it has 2 or 3 neighbors neighbors" do
    cells = Set.new [[1, 0], [1, 1], [1, 2]]
    world = World.new cells
    world.alive?([1,1]).should be_true
  end

  it "should return new cell map" do
    cells = Set.new [[1, 0], [1, 1], [1, 2]]
    world = World.new cells
    new_cells = Set.new [ [0,1], [1,1], [2,1] ]
    world.tick
    world.cells.should == new_cells
    world.tick
    world.cells.should == cells    
  end

  it "should print out the grid" do
    cells = Set.new [[1, 0], [1, 1], [1, 2]]
    world = World.new cells
    world.print_to_screen
    world.tick
    world.print_to_screen
    world.tick
    world.print_to_screen
  end
  
    it "should print out the grid" do
    cells = Set.new [[1, 0], [2,2], [2,3],[3, 0], [3,3], [3, 4], [4,4], [5, 4]]
    world = World.new cells
    world.print_to_screen
    world.tick
    world.print_to_screen
    world.tick
    world.print_to_screen
    loop do
      world.tick
      world.print_to_screen
    end
  end
end
