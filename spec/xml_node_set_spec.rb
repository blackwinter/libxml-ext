require File.join(File.dirname(__FILE__), 'spec_helper')

describe XML::Node::Set, ' when extended by XML::XQuery' do

  before :all do
    @set = DOC['//ACT']
    @set.should be_an_instance_of(XML::Node::Set)
  end

  it 'should be dup-able' do
    dup = @set.dup

    # not identical...
    dup.should_not == @set

    lambda {
      # ...but equal
      dup.to_a.should == @set.to_a
    }.should_not raise_error
    # (without segfaulting or anything)
  end

end
