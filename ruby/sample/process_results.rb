require 'rubygems'
require 'gruff'
require 'yaml'

require 'result'
require 'pdf_gens'

results = []
File.open("results.yaml", "r") do |f|
  results = YAML::load(f)
end

def sum(a)
  a.inject(0) {|a,x| a + x }
end

def mean(a)
  sum(a).to_f / a.size
end

def mean_result_for(results, version)
  mean(results.select {|r| r.sample_version == version}.map {|r| r.time_per_sample})
end

def mean_results_pdf_for(results, version, pdf)
  mean(results.select {|r| r.sample_version == version && r.pdf == pdf}.map {|r| r.time_per_sample})
end

mean_one = mean_result_for(results, 1)
mean_two = mean_result_for(results, 2)
#puts "mean of v1: ", mean_one
#puts "mean of v2: ", mean_two



#PdfGens::GENS.keys.each do |pdf|
#  mean_one = mean_results_pdf_for(results, 1, pdf)
#  mean_two = mean_results_pdf_for(results, 2, pdf)
#  puts "mean using #{pdf} of v1: #{mean_one}"
#  puts "mean using #{pdf} of v2: #{mean_two}"
#end

g = Gruff::Bar.new
#g.dot_radius = 3
#g.marker_count = 5
g.title = "sample Implementation Comparison"

g.data("sample implementation", [mean_one, mean_two])

#g.maximum_value = 1.0
g.minimum_value = 0.0
#g.x_axis_label = "Flip Number"
g.y_axis_label = "mean time/sample"

#g.labels = {0 => '2003', 2 => '2004', 4 => '2005'}
#g.labels = Hash[(1..10).map {|x| flip = x * N / 10;  [flip - 1, flip.to_s] }]
#g.labels[0] = "1"
g.labels = {0 => "1", 1 => "2" }

#g.hide_legend = true

g.write('overall_mean.png')

g = Gruff::Line.new
g.title = "impl, sample count"
#filter on 1, split on sample_count, avg over space, pdf
def split_on_sample_count_avg_over_space_pdf(results, sample_version)
  Hash[results.select {|r| r.sample_version == sample_version }.group_by { |r| r.sample_count }.map {|key, value| [key, mean(value.map { |r| r.time_per_sample })] }]
end
data1 = split_on_sample_count_avg_over_space_pdf(results, 1)
data1_values = data1.values
g.data("v1", data1_values)
data2 = split_on_sample_count_avg_over_space_pdf(results, 2)
data2_values = data2.values
g.data("v2", data2_values)

data_labels = data1.keys
g.labels = Hash[data_labels.map {|l| [l, l.to_s]}]
g.minimum_value = 0.0
g.x_axis_label = "sample count"
g.y_axis_label = "mean of space, pdf"
g.dot_radius = 3
g.line_width = 2
g.write("x_sample_count.png")

g = Gruff::Line.new
g.title = "impl, space"
#filter on 1, split on space, avg over sample_count, pdf
def split_on_space_avg_over_sample_count_pdf(results, sample_version)
  Hash[results.select {|r| r.sample_version == sample_version }.group_by { |r| r.space }.map {|key, value| [key, mean(value.map { |r| (r.time_per_sample * 100000).to_i })] }]
end
data1 = split_on_space_avg_over_sample_count_pdf(results, 1)
data1_values = data1.values
g.data("v1", data1_values)
data2 = split_on_space_avg_over_sample_count_pdf(results, 2)
data2_values = data2.values
g.data("v2", data2_values)

data_labels = data1.keys
g.labels = Hash[data_labels.each_with_index.map {|l,i| [i, l.to_s]}]
g.minimum_value = 0.0
g.x_axis_label = "space"
g.y_axis_label = "mean of sample_count, pdf"
g.dot_radius = 3
g.line_width = 2
g.marker_font_size = 15
g.write("x_space.png")

g = Gruff::Line.new
g.title = "impl, pdf"
#filter on 1, split on pdf, avg over space, sample_count
def split_on_pdf_avg_over_sample_count_space(results, sample_version)
  Hash[results.select {|r| r.sample_version == sample_version }.group_by { |r| r.pdf }.map {|key, value| [key, mean(value.map { |r| (r.time_per_sample * 100000).to_i })] }]
end
data1 = split_on_pdf_avg_over_sample_count_space(results, 1)
data1_values = data1.values
g.data("v1", data1_values)
data2 = split_on_pdf_avg_over_sample_count_space(results, 2)
data2_values = data2.values
g.data("v2", data2_values)

data_labels = data1.keys
g.labels = Hash[data_labels.each_with_index.map {|l,i| [i, l.to_s]}]
g.minimum_value = 0.0
g.x_axis_label = "pdf"
g.y_axis_label = "mean of sample_count, space"
g.dot_radius = 3
g.line_width = 2
g.marker_font_size = 15
g.write("x_pdf.png")

g = Gruff::Line.new
g.title = "impl, pdf"
#filter on 1, split on pdf, space, avg over sample_count
def split(results, sample_version, space)
  Hash[results.select {|r| r.sample_version == sample_version && r.space == space }.group_by { |r| r.pdf }.map {|key, value| [key, mean(value.map { |r| (r.time_per_sample * 100000).to_i })] }]
end
results.map { |r| r.space }.uniq.each do |space|
  data1 = split(results, 1, space)
  data1_values = data1.values
  g.data("v1 #{space}", data1_values)
  data2 = split(results, 2, space)
  data2_values = data2.values
  g.data("v2 #{space}", data2_values)
end

data_labels = data1.keys
g.labels = Hash[data_labels.each_with_index.map {|l,i| [i, l.to_s]}]
g.minimum_value = 0.0
g.x_axis_label = "pdf"
g.y_axis_label = "mean of sample_count, space"
g.dot_radius = 3
g.line_width = 2
g.marker_font_size = 15
g.write("x_pdf_space.png")

g = Gruff::Line.new
g.title = "impl, space, pdf"
#filter on 1, split on space, pdf, avg over sample_count
def split(results, sample_version, pdf)
  Hash[results.select {|r| r.sample_version == sample_version && r.pdf == pdf }.group_by { |r| r.space }.map {|key, value| [key, mean(value.map { |r| (r.time_per_sample * 100000).to_i })] }]
end
results.map { |r| r.pdf }.uniq.each do |pdf|
  data1 = split(results, 1, pdf)
  data1_values = data1.values
  g.data("v1 #{pdf}", data1_values)
  data2 = split(results, 2, pdf)
  data2_values = data2.values
  g.data("v2 #{pdf}", data2_values)
end

data_labels = data1.keys
g.labels = Hash[data_labels.each_with_index.map {|l,i| [i, l.to_s]}]
g.minimum_value = 0.0
g.x_axis_label = "space"
g.y_axis_label = "mean of sample_count"
g.dot_radius = 3
g.line_width = 2
g.marker_font_size = 15
g.write("x_space_pdf.png")

