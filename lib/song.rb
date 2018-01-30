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
    song = self.class.new(name)
  end
end
