require "gtk3"
class Regles

  def Regles.creer(gMenu, menuPere)
    new(gMenu, menuPere)
  end

  def initialize(gMenu, menuPere)
    @gMenu = gMenu
    @hBox = gMenu.box
    @pere = menuPere
    @vBox1 = Gtk::Box.new(:vertical)
    @vBox2 = Gtk::Box.new(:vertical)
    @hBox2 = Gtk::Box.new(:horizontal)
    temp = Gtk::TextBuffer.new()
    temp.set_text(
        "Each puzzle consists of a rectangular lattice of dots with some clues in various places.
        The object is to link adjacent dots so:\n
        \t*The value of each clue equals the number of links surrounding it.
        \t*Empty squares may be surrounded by any number of links.
        \t*When completed, the solution forms a single continuous loop with no crossings or branches."
        )
    @text = Gtk::TextView.new( temp)
    @text.editable=(false)
    @image1 = Gtk::Image.new("regles1.jpg")
    @image2 = Gtk::Image.new("regles2.jpg")
    @image1.set_padding(10, 10)
    @image2.set_padding(10, 10)
    @button = Gtk::Button.new(:label => "- Retour -")
    @button.signal_connect "clicked" do |_widget|
      gMenu.changerMenu(@pere, self)
    end
end

  def afficheToi()
    @vBox1.add(@button)
    @vBox2.add(@text)
    @hBox2.add(@image1)
    @hBox2.add(@image2)
    @vBox2.add(@hBox2)
    @hBox.add(@vBox1)
    @hBox.add(@vBox2)
  end

  def enleveToi()
    @hBox.remove(@vBox1)
    @hBox.remove(@vBox2)
  end

  def to_s()
    return "Regles"
  end
end

#http://pochopoch.blogspot.com/2013/04/layout-management-in-ruby-gtk.html