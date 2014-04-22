class FlockMutex
  def initialize(path)
    @file = File.open(path, 'a')
  end
  
  def lock
    @file.flock(File::LOCK_EX)
    self
  end
  
  def unlock
    @file.flock(File::LOCK_UN)
    self
  end
  
  def synchronize
    lock
    yield
  ensure
    unlock
  end
  
  def locked?
    File.open(@file.path, 'a') do |f|
      ! f.flock(File::LOCK_EX | File::LOCK_NB)
    end
  end
end