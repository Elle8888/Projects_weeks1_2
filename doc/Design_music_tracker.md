# {{PROBLEM}} Method Design Recipe

Design a single-class program that tracks and list music that have been listened to.

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

### Goals
> As a user
> So that I can keep track of my music listening
> I want to add tracks I've listened to and see a list of them
> Returns a list either by artist, album, song title, or genre

### Non-Goals
> Keep count of how many times a particular song has been listened to
> Validate the validity and accuracy of the inputs

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby

class Musiclist
  def initialize
    @songs = []
  end

  def tracker(song)
    # song is hash that contains the details of the music listened to containing the following key value pairs:
    # {artist: value, album:, value, title: value, genre: value}
  end

  def list
    # returns a list of songs with or without entering a key value pair
    # checks duplicates of songs already in the array
  end
```
## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# tracker method
# 1 raise an error for an array input
musiclist = Musiclist,new
musiclist.track([])
musiclist.track # => raised error "input not a hash"

# 2 raise an error for a string input
musiclist = Musiclist,new
musiclist.track("Master of Puppets")
musiclist.track # => raised error "input not a hash"

# 3 raise an error for an integer input
musiclist = Musiclist,new
musiclist.track(8)
musiclist.track # => raised error "input not a hash"

# 4 check the hash input if it has 4 key value pairs
musiclist = Musiclist,new
input = {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"}
musiclist.track(input) # => does not raise an error

# 5 raise an error when a key value pair is wrong
musiclist = Musiclist,new
input = {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", gene: "Pop"}
musiclist.track(input) # => raised error "put missing value"

# 6 raise an error when a key is missing (i.e. genre)
musiclist = Musiclist,new
input = {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero"}
musiclist.track(input) # => raised error "put missing value"

# 7 raise an error when a key is missing (i.e. title)
musiclist = Musiclist,new
input = {artist: "Taylor Swift", album: "Midnights", genre: "Pop"}
musiclist.track(input) # => raised error "put missing value"

# 8 raise an error when a key is missing (i.e. album)
musiclist = Musiclist,new
input = {artist: "Taylor Swift", title: "Anti-Hero", genre: "Pop"}
musiclist.track(input) # => raised error "put missing value"

# 9 raise an error when a key is missing (i.e. artist)
musiclist = Musiclist,new
input = {album: "Midnights", title: "Anti-Hero", gene: "Pop"}
musiclist.track(input) # => raised error "put missing value"

#list method
# 10 empty list
musiclist = Musiclist,new
musiclist.list # => []

# 11 returns a list with 2 inputs
musiclist = Musiclist,new
musiclist.track[
  {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"},
  {artist: "Taylor Swift", album: "Fearless", title: "Love Story", genre: "Country"}
]
musiclist.list # => [
  # {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"},
  # {artist: "Taylor Swift", album: "Fearless", title: "Love Story", genre: "Country"}
# ]

# 12 returns a list without duplicates
musiclist = Musiclist,new
musiclist.track[
  {artist: "Metallica", album: "Master of Puppets", title: "Master of Puppets", genre "Rock"},
  {artist: "Metallica", album: "Master of Puppets", title: "Master of Puppets", genre "Rock"} 
]
musiclist.list # => {artist: "Metallica", album: "Master of Puppets", title: "Master of Puppets", genre "Rock"}

# 13 returns a list of all the songs even if no key value pair is entered
musiclist = Musiclist,new
musiclist.track[
  {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"},
  {artist: "Metallica", album: "Master of Puppets", title: "Master of Puppets", genre "Rock"}
]
musiclist.list # => [
  # {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"},
  # {artist: "Metallica", album: "Master of Puppets", title: "Master of Puppets", genre "Rock"}
  # ]

# 14 returns a list of songs by a chosen key (i.e. artist) based on the list by the same artist
musiclist = Musiclist,new
musiclist.track[
  {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"},
  {artist: "Taylor Swift", album: "Fearless", title: "Love Story", genre: "Country"}
]
musiclist.list(artist: "Taylor Swift") # => [
  # {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"},
  # {artist: "Taylor Swift", album: "Fearless", title: "Love Story", genre: "Country"}
# ]

# 15 returns a list of songs by a chosen key (i.e. album) based on the list from various artists
musiclist = Musiclist,new
musiclist.track[
  {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"},
  {artist: "Metallica", album: "Master of Puppets", title: "Master of Puppets", genre "Rock"}
]
musiclist.list(album: "Midnights") # => {artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"}

# 16 returns an empty array if the filter key doesn't exist in the array
musiclist = Musiclist,new
musiclist.track{artist: "Taylor Swift", album: "Midnights", title: "Anti-Hero", genre: "Pop"}
musiclist.list(producer: "Taylor Swift") # => nil

# exists? method
# 17 checks the exists method
musiclist = Musiclist,new
musiclist.track({artist: "Metallica", album: "Master of Puppets", title: "Master of Puppets", genre: "Rock"})
musiclist.exists?({artist: "Metallica", album: "Master of Puppets", title: "Master of Puppets", genre: "Rock"})

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behavior

_After each test you write, follow the test-driving process of red, green, refactor to implement the behavior._