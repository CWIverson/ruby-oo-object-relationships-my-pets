require 'pry'
class Owner
  attr_reader :name, :species
  @@all=[]
  def initialize(name)
    @name = name
    @species = "human"
    @@all<<self
    @cats=[]
    @dogs=[]
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
    @@all.clear
  end
  def cats
    Cat.all.each do |cat|
      if (cat.owner == self) && !(@cats.include?(cat))
        @cats<<cat
      end
    end
    @cats
  end
  def dogs
    Dog.all.each do |dog|
      if (dog.owner == self) && !(@dogs.include?(dog))
        @dogs<<dog
      end
    end
    @dogs
  end
  def buy_cat(cat)
    Cat.new(cat, self)
  end
  def buy_dog(dog)
    Dog.new(dog, self)
  end
  def walk_dogs
    self.dogs.collect do |dog|
      dog.mood="happy"
    end
  end
  def feed_cats
    self.cats.collect do |cat|
      cat.mood="happy"
    end
  end
  def sell_pets
    self.cats.collect do |cat|
      cat.mood= "nervous"
      cat.owner= nil
    end
    self.dogs.collect do |dog|
      dog.mood= "nervous"
      dog.owner= nil
    end
    @cats.clear
    @dogs.clear
  end
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end