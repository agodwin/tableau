require File.expand_path("../LinkedList.rb", __dir__)


# a way to toggle logging
def log(msg, flag = false)
    puts msg if flag
end

# exit suite as soon as one example fails
# does not run remaining examples 
RSpec.configure do |c|
  c.fail_fast = true
end
