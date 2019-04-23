require "test_helper"

describe Work do
  let(:work) { Work.new }

  it "must be valid" do
    value(work).must_be :valid?
  end

  describe "entries method" do
    it "returns an array" do
    end
  end
end
