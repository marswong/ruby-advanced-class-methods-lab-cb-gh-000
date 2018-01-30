class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize(name)
    @name = name
  end

  def self.create
    song = self.class.new
    song.save
    song
  end

  def self.new_by_name(name)
    self.class.new(name)
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end
end
