require "flock_mutex"

describe FlockMutex do
  
  it "test locking" do
    m1 = FlockMutex.new("test.lock")
    m2 = FlockMutex.new("test.lock")
    
    m1.locked?.should be false
    m2.locked?.should be false
    
    m1.lock
    
    m1.locked?.should be true
    m2.locked?.should be true
    
    m1.unlock
    
    m1.locked?.should be false
    m2.locked?.should be false
    
    m1.lock
    
    my_var = 1
    
    thread = Thread.new do
      my_var = m2.synchronize { 2 }
    end
    
    my_var.should be 1
    
    m1.unlock
    
    thread.join
    
    my_var.should be 2
    
    m1.locked?.should be false
    m2.locked?.should be false
  end
  
  after do
    File.delete("test.lock") rescue nil
  end
  
end