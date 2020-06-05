require "pry" 
class Owner
  # code goes here
  attr_reader :name, :species
  @@all= []
  def initialize(name) 
    @name = name
    @species = "human"
    self.class.all << self
  end
  
  def say_species
    "I am a #{@species}."
    end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.length
  end
  
  def self.reset_all
    @@all = []
  end
  
  def cats 
Cat.all.select do |cats|
  cats.owner == self
end
end

  def dogs 
Dog.all.select do |dogs|
  dogs.owner == self
end
end

def buy_cat(cat_name)
  Cat.new(cat_name,self)
  end
  
  def buy_dog(dog_name)
  Dog.new(dog_name,self)
  end
  
  
    def walk_dogs
    self.dogs.map do |dogs|
      dogs.mood = "happy"
    end
  end 
  
     def feed_cats
    self.cats.map do |cats|
      cats.mood = "happy"
    end
  end
  
  def sell_pets
     self.dogs.map do |dogs|
      dogs.mood = "nervous"
      dogs.owner = nil
    end
     self.cats.map do |cats|
      cats.mood = "nervous"  
      cats.owner = nil
    end
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
   
  end
end