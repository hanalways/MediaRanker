require "test_helper"
require 'pry'

describe Work do
  describe "validations" do 
    before do 
      @work = Work.new(
        title: "test work",
        creator: "test creator",
        category: "book",
        publication_year: 1990,
        description: "test description"
      )
    end

    it "is valid with good data" do 
      result = @work.valid?
      
      expect(result).must_equal true
    end

    it "is invalid without a title" do 
      @work.title = nil

      expect(@work.valid?).must_equal false
    end

    it "is invalid for duplicate creator and title" do 
      @work.creator = Work.first.creator
      @work.title = Work.first.title 

      expect(@work.valid?).must_equal false
    end
  end

  describe "entries method" do
    it "returns an array" do

    end
  end

end
