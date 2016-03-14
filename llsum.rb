#! /usr/bin/env ruby

=begin
Consider representing an integer as singly linked list of it's digits. So the integer 157 would be represented as the list [1]->[5]->[7].
Create a function that adds two integers represented as lists, and returns the result in a list.

example input: [1]->[5]->[7] + [6]->[4]->[2]
example output: [7]->[9]->[9]
=end

# TODO: remove this hard coded file reference
require './LinkedList.rb'


def add_when_not_same_length a, b
    result = LinkedList.new
    
    # insure a is greater than b
    if a.size() <= b.size() then
        puts "ERROR: first arg must be longer than second arg"
        return result
    end

    result
end

def sum a, b
    result = nil
    
    if a.size() > b.size() then
        result = add_when_not_same_length(a, b)
        
    elsif b.size() > a.size() then
        result = add_when_not_same_length(b, a)
    else
        # a.size() == b.size()
        # sum the elements        
        result = LinkedList.new
        t1 = a.head
        t2 = b.head
        while t1.next_node != nil do
            result.add(t1.value + t2.value)
            t1 = t1.next_node
            t2 = t2.next_node
        end
        # got to do ome more value
        result.add(t1.value + t2.value)
    end
        
    result
end


a = LinkedList.new
a.add 1
a.add 5
a.add 7
puts "Linked List size is #{a.size} and contents are \"#{a.to_s()}\""

b = LinkedList.new
b.add 6
b.add 4
b.add 2
puts "Linked List size is #{b.size} and contents are \"#{b.to_s()}\""


c = sum(a, b)
puts "Linked List size is #{c.size} and contents are \"#{c.to_s()}\""

