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
        # append depending on the argument type
        
        size = 0
        if i.instance_of? Fixnum then
            size = append_node i
        elsif i.instance_of? LinkedList then
            size = append_list i
        else
            puts "don't know how to append #{i.class} - NO CHANGE TO LIST"
            size = @size
        end
        
        size        
    end
    
    def append_node(i)  
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
    
    def append_list i        
        temp = i.head
        while temp.next_node != nil do
            append_node(temp.value)
            temp = temp.next_node
        end
        # one more value
        append_node(temp.value)
        
        @size
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
