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
end
