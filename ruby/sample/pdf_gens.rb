
module PdfGens

uniform_gen = Proc.new { |size, i| 1.0/size }
all_on_one_gen = Proc.new { |size, i| if i == 0; 1.0; else; 0.0; end }
gaussian_gen = Proc.new { |size, i| gaussian_pdf(size/2.0, size/6.0, i) }
random_gen = Proc.new { |size, i| rand / size }

GENS = { "uniform" => uniform_gen, "all on one" => all_on_one_gen, "gaussian" => gaussian_gen, "random" => random_gen }

end
