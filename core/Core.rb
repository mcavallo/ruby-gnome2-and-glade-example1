module Core

  attr_accessor :main_window, :builder

  def init
    puts '> init'    
  	# if __FILE__ == $0

  		Gtk.init
  		@builder = Gtk::Builder::new

      @builder.add_from_file( $app_path + "/gui/main_window.glade" )
      @main_window = builder.get_object( "main_window" )

      @builder.connect_signals do |handler|
        puts "Handler: #{handler}"
        # method(handler)
      end

      @builder.objects.each do |o|
        formatted = o.builder_name.downcase.gsub(/[^a-z0-9_]/, '_')
        instance_variable_set( "@#{formatted}", o )
      end

      @main_window.signal_connect("destroy") do
        stop
      end

  	# end
  end

  def main
    puts '> main'
    Gtk.main
  end

  def stop
    puts '> stop'
    # if @main_window.transient_for.nil? 
    #   puts '> destroy_window'
    #   Gtk.main_quit
    # end
    Gtk.main_quit
    @main_window.destroy
  end

  def on_main_window__destroy()
  end

end