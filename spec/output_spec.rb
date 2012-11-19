require 'squares'

describe "Squares square" do
  shared_examples_for "a square number" do
    subject do
      Squares.new(input).output
    end

    it { should == output }
  end

  shared_examples_for "a non-square number" do
    subject do
      Squares.new(input)
    end

    it "should produce and error" do
      expect do
        subject.output
      end.to raise_error
    end
  end

  describe "3" do
    let(:input){3}

    it_should_behave_like "a non-square number"
  end

  describe "1" do
    let(:input){1}
    let :output do
      <<EO
1
EO
    end

    it_should_behave_like "a square number"
  end

  describe "4" do
    let(:input){4}
    let :output do
      <<EO
4 3
1 2
EO
    end

    it_should_behave_like "a square number"
  end

  describe "9" do
    let(:input){9}
    let :output do
      <<EO
5 4 3
6 1 2
7 8 9
EO
    end

    it_should_behave_like "a square number"
  end

  describe "16" do
    let(:input){16}
    let :output do
      <<EO
16 15 14 13
5  4  3  12
6  1  2  11
7  8  9  10
EO
    end

    it_should_behave_like "a square number"
  end

  describe "25" do
    let(:input){25}
    let :output do
      <<EO
17 16 15 14 13
18 5  4  3  12
19 6  1  2  11
20 7  8  9  10
21 22 23 24 25
EO
    end

    it_should_behave_like "a square number"
  end
end
