# implement a linked list class in Ruby


class Node
   @next_node
   attr_accessor :next_node

   @prev_node   
   attr_accessor :prev_node

   @value
   attr_accessor :value
   
   def initialize(value)
       @value = value
       @next_node = nil
       @prev_node = nil
   end
end


class LinkedList
    @head
    attr_reader :head
    
    @last
    attr_reader :tail
    
    @size
    attr_reader :size
    
    def initialize
        @head = nil
        @last = nil
        @size = 0
    end
    
    def append(i)    
        #puts "append #{i} to the end of the linked list"
        
        # special case - first node in the list        
        if (@head == nil) then
            @head = Node.new(i)
            @tail = @head
            @size = 1
            return @size
        end
        
        # normal case - append to the end of a linked list
        temp = @head
        while temp.next_node != nil do
            temp = temp.next_node
        end
        new_node = Node.new i
        temp.next_node = new_node
        new_node.prev_node = temp
        @size += 1
    end
    
    def insert(i)
        #puts "insert #{i} at the front of linked list"
        
        # special case - first node in the list        
        if (@head == nil) then
            return append(i)
       end
        
        # normal case - insert at the head of a linked list
        temp = Node.new i
        temp.next_node = @head
        @head.prev_node = temp
        @head = temp
        @size += 1
    end
    
    def to_s
        # special case - linked list is empty
        return "" if @head == nil
        
        temp = @head
        result = []        
        while temp.next_node != nil do
            result += [temp.value]
            temp = temp.next_node
        end
        # need to include the last value
        result += [temp.value]
        
        result.join("->").to_s
    end
end


#TODO: move testing into RSPEC 
#ll = LinkedList.new

#puts "Linked List size is #{ll.size} and contents are \"#{ll.to_s()}\""

#ll.append 4
#puts "Linked List size is #{ll.size} and contents are \"#{ll.to_s()}\""

#ll.append 2
#ll. append 7

#puts "Linked List size is #{ll.size} and contents are \"#{ll.to_s()}\""


#ll.insert 55
#puts "Linked List size is #{ll.size} and contents are \"#{ll.to_s()}\""

#ll.insert 65
#puts "Linked List size is #{ll.size} and contents are \"#{ll.to_s()}\""

#ll.append 30
#puts "Linked List size is #{ll.size} and contents are \"#{ll.to_s()}\""

#ll.append 40
#puts "Linked List size is #{ll.size} and contents are \"#{ll.to_s()}\""

#ll.insert 75
#puts "Linked List size is #{ll.size} and contents are \"#{ll.to_s()}\""



