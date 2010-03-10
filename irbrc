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
