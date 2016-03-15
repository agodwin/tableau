# 
# run this with bundle exec rspec spec/linked_list.rb -fd

require 'spec_helper'

RSpec.describe "LinkedList" do
    
    before(:each) do
        @ll = LinkedList.new
    end

    after(:each) do
        @ll = nil
    end    
    
    it "is created empty" do
        expect(@ll.size).to eql 0        
        expect(@ll.to_s()).to eql ""        
    end
    
    it "can append a value" do
        @ll.append 5
        expect(@ll.size).to eql 1        
        expect(@ll.to_s()).to eql "5"        
    end
   
    it "can insert a value" do
        @ll.insert 35
        expect(@ll.size).to eql 1        
        expect(@ll.to_s()).to eql "35"        
    end
    
    it "can append several values" do
        @ll.append 6
        @ll.append 7
        @ll.append 8
        expect(@ll.size).to eql 3        
        expect(@ll.to_s()).to eql "6->7->8"        
    end
    
    it "can insert several values" do
        @ll.insert 6
        @ll.insert 7
        @ll.insert 8
        expect(@ll.size).to eql 3        
        expect(@ll.to_s()).to eql "8->7->6"        
    end
    
    it "can insert and append values" do
        @ll.insert 4
        @ll.insert 5
        expect(@ll.size).to eql 2        
        expect(@ll.to_s()).to eql "5->4"

        @ll.append 6
        @ll.append 7
        expect(@ll.size).to eql 4 
        expect(@ll.to_s()).to eql "5->4->6->7"
        
        @ll.insert 32
        expect(@ll.size).to eql 5        
        expect(@ll.to_s()).to eql "32->5->4->6->7"
        
        @ll.append 42
        expect(@ll.size).to eql 6        
        expect(@ll.to_s()).to eql "32->5->4->6->7->42"
    end
    
    it "can append a linked list" do
        @ll.append 1
        @ll.append 2
        @ll.append 3
        expect(@ll.size).to eql 3        
        expect(@ll.to_s()).to eql "1->2->3"

        temp = LinkedList.new
        temp.append 4        
        temp.append 5        
        temp.append 6

        expect(temp.size).to eql 3        
        expect(temp.to_s()).to eql "4->5->6"  
        
        # first linked list has changed
        @ll.append temp
        expect(@ll.size).to eql 6        
        expect(@ll.to_s()).to eql "1->2->3->4->5->6"          

        # second linked list has NOT changed
        expect(temp.size).to eql 3        
        expect(temp.to_s()).to eql "4->5->6"  
    end
    
end
