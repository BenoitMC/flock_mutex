# FlockMutex

A very simple ruby mutex class using file lock.

## Usage

```ruby
require "flock_mutex"

mutex = FlockMutex.new("/tmp/test.lock")
mutex.lock
mutex.unlock
mutex.locked?
mutex.synchronize {
  #...
}
```

## Examples

```ruby
# my_app.rb

mutex = FlockMutex.new("/tmp/my_app.lock")

if mutex.locked?
  puts "Already running"
  exit false
end
```

## Install

    gem install flock_mutex

