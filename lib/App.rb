class App

  include Core

  def initialize
  end

  def start
    # Siempre al comienzo
    self.init

    @button1.signal_connect("clicked") do      
      dialog = Gtk::MessageDialog.new(
        @main_window, 
        Gtk::Dialog::DESTROY_WITH_PARENT,
        Gtk::MessageDialog::OTHER,
        Gtk::MessageDialog::BUTTONS_CLOSE,
        "\nSupuestamente escribiste:\n#{@entry1.text}"
      )
      dialog.run
      @entry1.text = ''
      dialog.destroy
    end

    @entry1.signal_connect('changed') do
      self.handle_button_status
    end

    @entry1.signal_connect('delete-text') do
      self.handle_button_status
    end

    @entry1.signal_connect('insert-text') do
      self.handle_button_status
    end

    @main_window.signal_connect("window_state_event") do
      self.handle_button_status
    end

    # Siempre al final
    self.main
  end

  def handle_button_status
    if ( @entry1.text.empty? )
      @button1.sensitive = false
    else
      @button1.sensitive = true
    end
  end

end