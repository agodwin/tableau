#! /usr/bin/env ruby

=begin
Consider representing an integer as singly linked list of it's digits. So the integer 157 would be represented as the list [1]->[5]->[7].
Create a function that adds two integers represented as lists, and returns the result in a list.

example input: [1]->[5]->[7] + [6]->[4]->[2]
example output: [7]->[9]->[9]
=end

# TODO: remove this hard coded file reference
require './LinkedList.rb'


def sum_when_not_same_length a, b
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
        result = sum_when_not_same_length(a, b)
        
    elsif b.size() > a.size() then
        result = sum_when_not_same_length(b, a)
    else
        # a.size() == b.size()
        # sum the elements        
        result = LinkedList.new
        t1 = a.head
        t2 = b.head
        while t1.next_node != nil do
            result.append(t1.value + t2.value)
            t1 = t1.next_node
            t2 = t2.next_node
        end
        # got to do ome more value
        result.append(t1.value + t2.value)
    end
        
    result
end


a = LinkedList.new
a.append 1
a.append 5
a.append 7
puts "Linked List size is #{a.size} and contents are \"#{a.to_s()}\""

b = LinkedList.new
b.append 6
b.append 4
b.append 2
puts "Linked List size is #{b.size} and contents are \"#{b.to_s()}\""


c = sum(a, b)
puts "Linked List size is #{c.size} and contents are \"#{c.to_s()}\""

