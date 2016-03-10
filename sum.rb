#! /usr/bin/env ruby

=begin
Consider representing an integer as singly linked list of it's digits. So the integer 157 would be represented as the list [1]->[5]->[7].
Create a function that adds two integers represented as lists, and returns the result in a list.

example input: [1]->[5]->[7] + [6]->[4]->[2]
example output: [7]->[9]->[9]
=end


def add_when_not_same_length(a, b)
    result = [] 
    # insure a is greater than or equal to b
    if a.length < b.length then
        puts "ERROR: first arg must be longer than second arg"
        return result
    end
        
    # insure a is not equal to b
    if a.length == b.length then
        puts "ERROR: arguments must not be equal length"
        return result
    end
    
    # input is good length sum the linked lists
    # TODO: add error handling for array elements which are non-numeric    
    # move shortest array from back if not equal
    
    # offset depends on the difference in the lenght of the two arrays
    #puts "a length #{a.length} b length #{b.length}"
    difference = a.length - b.length
    
    (b.length-1).downto(0) do |i|
        #puts "loop #{i} - adding a[#{i+difference}] + b[#{i}] => #{a[i+difference]} + #{b[i]} => #{a[i+difference] + b[i]}"
    
        result.push(a[i+difference] + b[i])
    end
    #puts "current results are #{result.inspect}"
    
    # copy remainder of longer array
    (a.length - b.length-1).downto(0) do |j|
        #puts "loop #{j} moving #{a[j]}"
        result.push(a[j])
    end
    
    #puts "current results are #{result.inspect}"
    
    result.reverse
end


def sum(a, b)
    result = [] 
    
    if a.length > b.length then
        result = add_when_not_same_length(a,b)
    
    elsif a.length < b.length
        result = add_when_not_same_length(b,a)
    
    else
        # a.length == b.length
        # sum the values
        0.upto(a.length-1) do |k|
            result.push(a[k] + b[k])
        end        
    end
    
    result
end


#a = [5, 1, 5, 7]
#b =    [6, 4, 2]

#a = [1, 1, 1]
#b = [2, 2, 2, 2]

#a = [1, 5, 7]
#b = [6, 4, 2]


# take arrays from th CLI - quick & dirty
# TODO: replace this with OPTPARSE
a = ARGV[0].scan(/\d/).map(&:to_i)
b = ARGV[1].scan(/\d/).map(&:to_i)

puts "given #{a.inspect} and #{b.inspect} the sum is: "
puts sum(a, b).inspect
