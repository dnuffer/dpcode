class DiscreteSamplerCondensedTableLookup
  def initialize(events_and_weights)
    @events_and_weights = events_and_weights
    normalize_weights
    gen_tables
    #puts "lens aa:#{@aa.size} bb:#{@bb.size} cc:#{@cc.size} dd:#{@dd.size} ee:#{@ee.size}"
    #puts "aa:#{@aa.inspect} bb:#{@bb.inspect} cc:#{@cc.inspect} dd:#{@dd.inspect} ee:#{@ee.inspect}"
    #puts "@t1: #{@t1} @t2: #{@t2} @t3: #{@t3} @t4: #{@t4}"
  end

  # gets kth digit of m (base 64)
  def get_digit(m, k) 
    #puts "#{k}th digit of #{m} is #{((m >> (30 - 6 * k)) & 63)}"
    ((m >> (30 - 6 * k)) & 63)
  end

  def normalize_weights
    total = @events_and_weights.values.reduce { |memo, obj| memo + obj }
    @events_and_weights.each { |key, value|
      @events_and_weights[key] = value * (1<<30) / total
      #puts "Normalized #{value} to #{@events_and_weights[key]}"
    }

    remaining = (1<<30) - (@events_and_weights.values.reduce { |memo, obj| memo + obj })
    if remaining > 0
      largest = @events_and_weights.reduce { |memo, obj| memo[1] > obj[1] ? memo : obj }
      @events_and_weights[largest[0]] += remaining
    end
  end

  def gen_tables
    na = nb = nc = nd = ne = 0
    @events_and_weights.each { |name, weight| 
      na += get_digit(weight, 1)
      nb += get_digit(weight, 2)
      nc += get_digit(weight, 3)
      nd += get_digit(weight, 4)
      ne += get_digit(weight, 5)
    }

    @aa = [0] * na
    @bb = [0] * nb
    @cc = [0] * nc
    @dd = [0] * nd
    @ee = [0] * ne

    @t1 = na << 24
    @t2 = @t1 + (nb << 18); 
    @t3 = @t2 + (nc << 12); 
    @t4 = @t3 + (nd << 6);

    na = nb = nc = nd = ne = 0;

    @events_and_weights.each { |name, weight| 
      (0..get_digit(weight, 1)-1).each { |j|
        @aa[na + j] = name
      }
      na += get_digit(weight, 1)

      (0..get_digit(weight, 2)-1).each { |j|
        @bb[nb + j] = name
      }
      nb += get_digit(weight, 2)

      (0..get_digit(weight, 3)-1).each { |j|
        @cc[nc + j] = name
      }
      nc += get_digit(weight, 3)

      (0..get_digit(weight, 4)-1).each { |j|
        @dd[nd + j] = name
      }
      nd += get_digit(weight, 4)

      (0..get_digit(weight, 5)-1).each { |j|
        @ee[ne + j] = name
      }
      ne += get_digit(weight, 5)
    }
  end

  def sample
    j = rand(1<<30)

    return @aa[j>>24]           if (j < @t1) 
    return @bb[(j - @t1) >> 18] if (j < @t2) 
    return @cc[(j - @t2) >> 12] if (j < @t3) 
    return @dd[(j - @t3) >> 6]  if(j < @t4) 
    return @ee[j - @t4]
  end
end

if __FILE__ == $0
  events_and_weights =
  {
      "1" => 1,
      "2" => 2,
      "10" => 10,
  }

  ds = DiscreteSamplerCondensedTableLookup.new(events_and_weights)
  results = Hash.new(0)
  130000.times { results[ds.sample] += 1 }
  puts results.inspect

  events_and_weights =
  {
  }
  10000.times { |i|
    events_and_weights[i] = 1
  }

  ds = DiscreteSamplerCondensedTableLookup.new(events_and_weights)
  results = Hash.new(0)
  10000000.times { results[ds.sample] += 1 }
  puts results.inspect
end

