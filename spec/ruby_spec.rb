require 'spec_helper'

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
end
