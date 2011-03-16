class SpecTest
  def a
    puts 'int method a'
    "a"
  end

  def b
    self.a
  end
end


shared_examples_for "expamples" do
  puts 'in expamples'
  1.should == 1
end

describe SpecTest do
  it "it should be true" do
    true.should be_true
    1.should >= 0 

    proc {raise}
  end

  it "test block" do
    proc { raise }.should raise_error
  end

  it_should_behave_like "expamples"
end
############################

describe SpecTest do
  before do
    @mock = SpecTest.new
  end

  it "test should receive expectation" do
    @mock.should_receive(:a).once.with(no_args())
    @mock.b
  end

it "test should receive expectation" do
    @mock.should_receive(:a).with(no_args())
    @mock.b
  end

end
#############################

describe SpecTest do
  before do
    @mock = SpecTest.new
    SpecTest.stub!(:nihao).and_return("nihao")
  end


  it "should return nihao" do
    SpecTest.nihao.should == "nihao"
  end

end


