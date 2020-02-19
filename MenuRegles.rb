load "Regles.rb"
load "Techniques.rb"
require "gtk3"
class MenuRegles

  def MenuRegles.creer(gMenu, menuPere)
    new(gMenu, menuPere)
  end

  def initialize(gMenu, menuPere)
    @gMenu = gMenu
    @hBox = gMenu.box
    @pere = menuPere
    @vBox1 = Gtk::Box.new(:vertical)
    @vBox2 = Gtk::Box.new(:vertical)
    @button = Gtk::Button.new(:label => "- Retour -")
    @button.signal_connect "clicked" do |_widget|
      gMenu.changerMenu(@pere, self)
    end
    @button2 = Gtk::Button.new(:label => 'Règles')
    @button2.signal_connect('clicked') {
        gMenu.changerMenu(Regles.creer(@gMenu,self), self)
    }
    @button3 = Gtk::Button.new(:label => 'Techniques')
    @button3.signal_connect('clicked') {
        gMenu.changerMenu(Techniques.creer(@gMenu,self), self)
    }
end

  def afficheToi()
    @vBox1.add(@button)
    @vBox2.add(@button2)
    @vBox2.add(@button3)
    @hBox.add(@vBox1)
    @hBox.add(@vBox2)
  end

  def enleveToi()
    @hBox.remove(@vBox1)
    @hBox.remove(@vBox2)
  end

  def to_s()
    return "MenuRegles"
  end
end