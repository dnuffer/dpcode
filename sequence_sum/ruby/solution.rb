def calc_sum(seq)
  seq.reduce(0) { |memo, obj| memo + obj }
end

calc_sum([1,2,3])

