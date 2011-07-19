require 'test_helper'

describe Item do
  before do
    @item = Item.make
  end

  describe "associations" do
    it "belongs to an user" do
      @item.must_respond_to :user
    end
  end

  describe "validations" do
    it "is not valid without a category" do
      @item.category = nil
      @item.valid?.must_equal false
    end
    it "is not valid with nonexistent category" do
      @item.category = "fap"
      @item.valid?.must_equal false
    end
    it "is not valid without a short description" do
      @item.short_description = nil
      @item.valid?.must_equal false
    end
    it "is not valid without desired stock" do
      @item.desired_stock = nil
      @item.valid?.must_equal false
    end
    it "is not valid with subzero desired stock" do
      @item.desired_stock = -1
      @item.valid?.must_equal false
    end
    it "is not valid without actual stock" do
      @item.actual_stock = nil
      @item.valid?.must_equal false
    end
    it "is not valid with subzero actual stock" do
      @item.actual_stock = -1
      @item.valid?.must_equal false
    end
  end
end
