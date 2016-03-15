#! /usr/bin/env ruby

=begin
Consider representing an integer as singly linked list of it's digits. So the integer 157 would be represented as the list [1]->[5]->[7].
Create a function that adds two integers represented as lists, and returns the result in a list.

example input: [1]->[5]->[7] + [6]->[4]->[2]
example output: [7]->[9]->[9]
=end

# TODO: remove this hard coded file reference
require './LinkedList.rb'


def sum_when_same_length node_a, node_b
    # sum the elements        
    result = LinkedList.new
    while node_a.next_node != nil do
        result.append(node_a.value + node_b.value)
        node_a = node_a.next_node
        node_b = node_b.next_node
    end
    # got to sum one more value
    result.append(node_a.value + node_b.value)

    # return a linked list
    result
end

def sum_when_not_same_length a, b
    result = LinkedList.new
    
    # insure a is greater than b
    if a.size() <= b.size() then
        puts "ERROR: first arg must be longer than second arg"
        return result
    end

    # copy element from longer list
    difference = a.size() - b.size()
    current = a.head
    1.upto(difference) do 
       result.append(current.value)
       current = current.next_node
    end
    
    # sum the remaining elements
    # generate a new linked list with the sums
    t1 = current
    t2 = b.head
    tmp_list = sum_when_same_length t1, t2    
    # append new linked list to the end of the result
    result.append tmp_list    
    
    # return a linked list
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
        result = sum_when_same_length(a.head, b.head)
    end
        
    # return a linked list
    result
end

#TODO get linked list values from the CLI
#TODO: move test code into an RSPEC
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
