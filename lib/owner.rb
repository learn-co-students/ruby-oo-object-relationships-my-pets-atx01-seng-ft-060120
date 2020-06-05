require "pry"

class Owner
  
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"

    @@all << self
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
    Cat.all.select do |cat_array|
      cat_array.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog_array|
      dog_array.owner == self
    end
  end

  def buy_cat(new_cat_name)
    Cat.new(new_cat_name, self)
  end

  def buy_dog(new_dog_name)
    Dog.new(new_dog_name, self)
  end

  def walk_dogs
    self.dogs.map do |dog_array|
      dog_array.mood = "happy"
    end
  end

  def feed_cats
    self.cats.map do |cat_array|
      cat_array.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.map do |dog_array|
      dog_array.mood = "nervous"
      dog_array.owner = nil
    end
    self.cats.map do |cat_array|
      cat_array.mood = "nervous"
      cat_array.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end



end