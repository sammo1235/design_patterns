# The MusicComponent class is the
# general 'Component' class in this
# implementation of the Composite
# pattern.
class MusicComponent
  attr_reader :children

  def initialize
    @children = []
  end

  # The 'add' method adds a child component
  # to the current component class.
  def add_child(component)
    @children.push(component)
    component.parent = self
  end

  # The 'remove' method removes a child
  # component from the current component
  # class.
  def remove_child(component)
    @children.delete(component)
    component.parent = nil
  end

  # The 'get_child' method will return a
  # child of this class by index.
  def get_child(index)
    @children[index]
  end

  # The 'get_children' method will return
  # an array of the children of the current
  # component.
  def get_children
    @children
  end
end

# The 'Discography' class is a
# 'composite' class within this
# implementation of the Composite
# pattern.
class Discography < MusicComponent
  # A Discography has an artist
  # property
  attr_accessor :artist

  def initialize(artist)
    @artist = artist
    super()
  end
end

# The 'Album' class is a 'composite'
# class within this implementation
# of the Composite pattern.
class Album < MusicComponent
  # An Album has a title and a reference
  # to the parent component
  attr_accessor :parent, :title

  def initialize(title)
    @title = title
    super()
  end
end

# The 'Song' class is a 'leaf'
# class within this implementation
# of the Composite pattern.
class Song < MusicComponent
  # A Song has a title and a reference
  # to the parent component
  attr_accessor :parent, :title

  def initialize(title)
    @title = title
  end
end

# We create a discography
beatles_discography = Discography.new('The Beatles')

# We create a few albums here to add to the discography
rubber_soul = Album.new('Rubber Soul')
revolver = Album.new('Revolver')
sgt_peppers = Album.new('Sgt. Pepper\'s Lonely Hearts Club Band')
abbey_road = Album.new('Abbey Road')

# We add a few songs to the albums here
rubber_soul.add_child Song.new('Norwegian Wood')
rubber_soul.add_child Song.new('Nowhere Man')
revolver.add_child Song.new('Eleanor Rigby')
revolver.add_child Song.new('Tomorrow Never Knows')
sgt_peppers.add_child Song.new('With a Little Help from My Friends')
sgt_peppers.add_child Song.new('Getting Better')
abbey_road.add_child Song.new('Come Together')
abbey_road.add_child Song.new('Here Comes the Sun')

# We add the albums to the discography
beatles_discography.add_child rubber_soul
beatles_discography.add_child revolver
beatles_discography.add_child sgt_peppers
beatles_discography.add_child abbey_road

# We can now navigate through the discography with ease
beatles_discography.children.map {|album| album.title } # [rubber_soul, revolver, sgt_peppers, abbey_road]
beatles_discography.children.first.children.map {|song| song.title } # ['Norwegian Wood', 'Nowhere Man']
norwegian_wood = beatles_discography.children.first.children.first # 'Norwegian Wood'
norwegian_wood.parent.title # Rubber Soul
norwegian_wood.parent.parent # Beatle's Discography