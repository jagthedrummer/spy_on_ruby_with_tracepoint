#!ruby

def sometimes_divide_by_zero
  if [true, false].sample
    0 / 0
  else
    return 'we returned a thing'
  end
rescue
  # lol we failed, who cares?
end

trace = TracePoint.new(:raise) do |tp|
  puts (tp.methods - Kernel.methods)
end

#10.times do
  #puts sometimes_divide_by_zero.class
#end
#

trace.enable

0 / 0

puts "----------------"

puts (trace.methods - Kernel.methods)
