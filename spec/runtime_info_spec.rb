require 'spec_helper'
require 'rbconfig'

describe Runtime do
  it "knows its engine" do
    if defined? RUBY_ENGINE
      Runtime.engine.should == RUBY_ENGINE
    else
      Runtime.engine.should == 'ruby'
    end
  end
  
  it "knows its platform" do
    Runtime.platform.should == RUBY_PLATFORM
  end
  
  it "knows its CPU architecture" do
    Runtime.arch.should == Config::CONFIG['host_cpu']
  end
  
  it "knows its OS" do
    Runtime.os.should == Config::CONFIG['host_os']
  end
  
  it "knows the path to the Ruby interpreter" do
    path = Runtime.path
    
    File.executable?(path).should be_true
    
    # Let's give it some Ruby to execute!
    result = `#{path} -e 'p 40.send(:+, 2)'`.to_i
    result.should == 42
  end
end