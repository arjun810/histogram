require 'gnuplot'

module Histogram

  module Plot
    DEFAULTS = {
      xlabel: 'bins',
      ylabel: 'counts',
    }

  end

  class << self

    def plot(bins, freqs, opts={})
      one_set = freqs.first.is_a?(Numeric)

      freqs = [freqs] if one_set
      opt = {:bin_boundary => Histogram::DEFAULT_BIN_BOUNDARY }.merge( opts )

      Gnuplot.open do |gp|
        Gnuplot::Plot.new( gp ) do |plot|
          [:xrange, :yrange, :title, :xlabel, :ylabel].each do |cat|
            plot.send(cat, opt[cat]) if opt[cat]
          end

          plot.data = [
            Gnuplot::DataSet.new( )


          ]

        end
      end

    end
  end
end
