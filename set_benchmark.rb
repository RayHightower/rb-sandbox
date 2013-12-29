require 'benchmark'

puts "First measurement = "
puts Benchmark.measure {x = 10000.times.to_a}

a,b,c = x.dup, x.dup, x.dup

Benchmark.measure { 1000.times { out = []; out += a; out += b; out +=c; out.uniq! } }

Benchmark.measure { 1000.times { out = Set.new; out += a; out += b; out +=c; } }

Benchmark.measure { 1000.times { out = {}; a.each {|e| out[e] ||= 1}; b.each {|e| out[e] ||= 1}; c.each {|e| out[e] ||= 1}; } }




