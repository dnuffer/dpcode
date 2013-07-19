#!/usr/bin/env ruby

require './discrete_sampler_condensed_table_lookup'

# http://www.tiobe.com/content/paperinfo/tpci/index.html
#2013 2012  Language              Rating  Delta     Status
# Pos  Pos
#  1   1    C                     17.809% +0.08%    A
#  2   2    Java                  16.656% +0.39%    A
#  3   4    Objective-C           10.356% +1.26%    A
#  4   3    C++                   8.819%  -0.54%    A
#  5   7    PHP                   5.987%  +0.70%    A
#  6   5    C#                    5.783%  -1.24%    A
#  7   6    (Visual) Basic        4.348%  -1.70%    A
#  8   8    Python                4.183%  +0.33%    A
#  9   9    Perl                  2.273%  +0.05%    A
# 10  11    JavaScript            1.654%  +0.18%    A
# 11  10    Ruby                  1.479%  -0.20%    A
# 12  12    Visual Basic .NET     1.067%  -0.15%    A
# 13  17    Transact-SQL          0.913%  +0.21%    A
# 14  14    Lisp                  0.879%  -0.11%    A
# 15  16    Pascal                0.779%  -0.07%    A
# 16  21    Bash                  0.711%  +0.09%    A
# 17  19    PL/SQL                0.657%  +0.02%    A--
# 18  13    Delphi/Object Pascal  0.602%  -0.55%    A--
# 19  18    Ada                   0.575%  -0.11%    B
# 20  22    MATLAB                0.563%  0.00%     B

class LangSelector
  def initialize(top_dir)
    entries = Dir.entries(top_dir)
    @lang_dir_and_weights =
    {
        "c" => 50,
        "java" => 100,
        "obj-c" => 100,
        "c++" => 100,
        "php" => 75,
        "c#" => 25,
        "python" => 75,
        "perl" => 25,
        "js" => 150,
        "ruby" => 100,
        "lisp" => 25,
        "bash" => 50,
        "go" => 150,
        "octave" => 75,
        "R" => 75,
        "bash" => 50,
    }.delete_if { |k, v|
      !entries.include? k
    }

    fail "No matching language directories found in #{top_dir}" if @lang_dir_and_weights.empty?
    @ds = DiscreteSamplerCondensedTableLookup.new(@lang_dir_and_weights)
  end

  def pick_lang
    @ds.sample
  end

  def langs
    @lang_dir_and_weights.keys
  end

end

if __FILE__ == $0
  ls = LangSelector.new(ARGV[0])
  10.times { puts ls.pick_lang }
end
