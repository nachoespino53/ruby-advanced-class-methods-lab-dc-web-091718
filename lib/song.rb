class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|x| x.name}
  end

  def self.new_from_filename(file_name)
    array = file_name.split(/\ - |\.mp3/)
    song = self.new_by_name(array[1])
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(file_name)
    array = file_name.split(/\ - |\.mp3/)
    song = self.create_by_name(array[1])
    song.artist_name = array[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end



end
