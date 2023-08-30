
require 'spec_helper'
describe Label do
  before(:each) do
    @label = Label.new('Title 101', 'Black')
  end

  describe '#new' do
    it 'takes twp parameters and returns a label object' do
      @label.should be_an_instance_of Label
    end
  end
  describe '#Title' do
    it 'returns the correct title' do
      @label.title.should eql 'Title 101'
    end
    it 'returns the correct color' do
        @label.color.should eql 'Black'
      end

  end
  describe '#add_item' do
    it 'sets the label on the item' do
      item = double('item')
      allow(item).to receive(:label=)

      @label.add_item(item)

      expect(item).to have_received(:label=).with(@label)
    end
  end
end