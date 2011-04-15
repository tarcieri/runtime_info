require 'spec_helper'
require 'rbconfig'

describe Ruby do
  it "knows its engine" do
    if defined? RUBY_ENGINE
      Ruby.engine.should == RUBY_ENGINE
    else
      Ruby.engine.should == 'ruby'
    end
  end
  
  it "knows its platform" do
    Ruby.platform.should == RUBY_PLATFORM
  end
  
  it "knows its CPU architecture" do
    Ruby.arch.should == Config::CONFIG['host_cpu']
  end
  
  it "knows the path to the Ruby interpreter" do
    path = Ruby.path
    
    File.executable?(path).should be_true
    
    # Let's give it some Ruby to execute!
    result = `#{path} -e 'p 40.send(:+, 2)'`.to_i
    result.should == 42
  end
end