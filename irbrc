require 'rubygems'

# http://pablotron.org/software/wirble/README
colors = {
  :comma => :gray,

  :open_array => :white, # [
  :close_array => :white, # ]
  :open_hash          => :white,
  :close_hash         => :white,

  :open_string => :green, # "
  :close_string => :green, # "

  :number => :brown, # int | float
  :string => :green, # string :)

  :symbol             => :cyan,
  :symbol_prefix      => :cyan,
  :refers => :brown, # =>
}

begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
  wirble_colors = Wirble::Colorize.colors.merge(colors)
  Wirble::Colorize.colors = wirble_colors
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

# also from http://themomorohoax.com/2009/03/27/irb-tip-load-files-faster
def rl(file_name = nil)
  if file_name.nil?
    if !@recent.nil?
      rl(@recent) 
    else
      puts "No recent file to reload"
    end
  else
    file_name += '.rb' unless file_name =~ /\.rb/
    @recent = file_name 
    load "#{file_name}"
  end
end
