require 'pry'

class Owner
  # code goes here

  attr_accessor :name, :pets, :fish_list
  attr_reader :species, :cat_count, :dog_count, :fish_count

  @@all = Array.new

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {cats: [], dogs: [], fishes: []}
    @@all << self
  end

# ----- class methods ----- #

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  # --- instance methods --- #

  def say_species
    "I am a #{self.species}."
  end

  def pets
    @pets
  end

  def buy_fish(fish)
    self.pets[:fishes] << Fish.new(fish)
  end

  def buy_cat(cat)
    self.pets[:cats] << Cat.new(cat)
  end

  def buy_dog(dog)
    self.pets[:dogs] << Dog.new(dog)
  end

  def walk_dogs
    self.pets[:dogs].each do |dog|
    dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].each do |cat|
    cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets.each {|species, species_array| species_array.each {|pet| pet.mood = "nervous"}}
    self.pets.each {|species, species_array| species_array.clear}
  end

  # def count_pets
  #   @cat_count = self.pets[:cats].size
  #   @fish_count = self.pets[:fishes].size
  #   @dog_count = self.pets[:dogs].size
  #   binding.pry
  # end

  def list_pets
    cat_count = self.pets[:cats].size
    fish_count = self.pets[:fishes].size
    dog_count = self.pets[:dogs].size
    # pet_count = self.pets.map {|species, species_array| species_array.count}
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
    # binding.pry
  end

end

# Pry.start
