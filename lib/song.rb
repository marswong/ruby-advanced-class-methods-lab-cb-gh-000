class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize(name = "")
    @name = name
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.bsearch { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ? song : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort do |x, y|
      if x.name <= y.name
        -1
      else
        1
      end
    end
  end

  def self.new_from_filename(filename)
    arr = filename.split(" - ")
    artist_name = arr[0]
    name = arr[1].gsub(/\..*/, "")
    song = self.new_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
