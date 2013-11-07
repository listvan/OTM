begin
  require 'rubygems'
  require 'metric_fu'

  #cucumber_path = `which cucumber`.strip

  #MetricFu::Configuration.run do |config|
  #  config.metrics  = [:churn, :flay, :reek, :roodi, :rcov, :flog, :stats]
# #   config.metrics  = [:churn, :flay, :reek, :roodi, :rcov, :flog, :saikuro, :stats]
  #  config.graphs   = [:flog, :flay, :stats, :roodi, :rcov, :reek]
  #  config.graph_engine = :gchart
  #  config.flay ={:dirs_to_flay => ['app', 'lib'],
  #    :filetypes => ['rb'] }
  #  config.flog = { :dirs_to_flog => ['app', 'lib'] }
  #  config.reek = { :dirs_to_reek => ['app', 'lib'] }
  #  config.roodi = { :dirs_to_roodi => ['app', 'lib'] }
# #   config.saikuro  = { :output_directory => 'tmp/metric_fu/saikuro', 
# #     :input_directory => ['app', 'lib'],
# #     :cyclo => "",
# #     :filter_cyclo => "0",
# #     :warn_cyclo => "5",
# #     :error_cyclo => "7",
# #     :formater => "text"}
 
  #  config.rcov = { :environment => 'test',
  #    :test_files => ['spec/**/*_spec.rb'],
  #      :rcov_opts => ["--sort coverage", 
  #        "--no-html", 
  #        "--text-coverage",
  #        "--no-color",
  #        "--profile",
  #        "--rails",
  #        "--exclude /gems/,/Library/,/usr/,spec"],
  #        :external => nil
  #  }
  #  config.rcov[:rcov_opts] << "-Ispec" # Needed to find spec_helper
  #
  #  #HA kell a cucumber!!
  # # config.rcov[:rcov_opts] << '--aggregate tmp/metric_fu/scratch/rcov/coverage.data'
  # # config.rcov[:rcov_opts] << '&&'
  # # config.rcov[:rcov_opts] << "rcov #{cucumber_path}"
  # # config.rcov[:rcov_opts] << '--no-html'
  # # config.rcov[:rcov_opts] << '--text-coverage'
  # # config.rcov[:rcov_opts] << '--no-color'
  # # config.rcov[:rcov_opts] << '--rails'
  # # config.rcov[:rcov_opts] << '--exclude /.gem/,/gems/,/Library/,spec,vendor,features/*'
  # # config.rcov[:rcov_opts] << '--aggregate tmp/metric_fu/scratch/rcov/coverage.data'
  #end
end
