require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe LibXML::Ext do

  it 'should find all acts' do
    DOC['//ACT'].size.should == 5
  end

  it 'should find all acts with Hpricot-style syntax' do
    (DOC/'//ACT').size.should == 5
  end

  it 'should find all speakers per act' do
    DOC['//ACT'].map { |act|
      act['descendant::node()/SPEAKER'].size
    }.should == [259, 202, 252, 180, 257]
  end

  it 'should find all unique speakers per act' do
    DOC['//ACT'].map { |act|
      act['descendant::node()/SPEAKER'].uniq.size
    }.should == [14, 10, 15, 15, 13]
  end

  it 'should find descendant::node() with abbreviated syntax' do
    act = DOC['//ACT'].first

    act['**/SPEAKER'].to_a.should == act['descendant::node()/SPEAKER'].to_a
  end

  it 'should not have any side-effects when using non-bang uniq' do
    speakers = DOC['//ACT'].first['descendant::node()/SPEAKER']

    lambda {
      speakers.uniq
    }.should_not change(speakers, :size)
  end

  it 'should indeed have side-effects when using bang uniq' do
    speakers = DOC['//ACT'].first['descendant::node()/SPEAKER']

    lambda {
      speakers.uniq!
    }.should change(speakers, :size)
  end

end
