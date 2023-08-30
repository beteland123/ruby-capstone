require 'spec_helper'

describe Author do
  let(:author) { Author.new("John", "Doe") }
  let(:item) { Item.new("2022-08-30") } 

  describe "#add_item" do
    it "associates the item with the author and adds it to the author's items" do
      author.add_item(item) 

      expect(item.author).to eq(author)
      expect(author.instance_variable_get(:@items)).to include(item)
    end
  end
end
