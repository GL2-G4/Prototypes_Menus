require "gtk3"
class Parametres

    def Parametres.creer(gMenu, menuPere)
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
        @titre = Gtk::Label.new("PARAMETRES")
        @titre.style_context.add_class("titre")

        # Selection d'un style de grille

            # A combobox with string IDs

                combo = Gtk::ComboBoxText.new
                combo.style_context.add_class("combo")
                combo.append("t1", "Default Theme")
                combo.append("t2", "Dark Theme")
                combo.append("t3", "Red Theme")
                combo.append("t4", "Space Theme")
                combo.append("t5", "Happy Theme")

            boxBouton = Gtk::ButtonBox.new(:horizontal)
            @border = Gtk::Frame.new()
            boxBouton.set_border_width(10)
            textBox = Gtk::Label.new("Style de la grille : ")
            #bouton = Gtk::Button.new()
            #bouton.set_label("Theme 1")
            #bouton.signal_connect "clicked" do |_widget|
                # TODO
            #end
            boxBouton.add(textBox)
            #boxBouton.add(bouton)
            boxBouton.add(combo)
            @border.add(boxBouton)

        # Selection d'une taille de fenetre

                combo2 = Gtk::ComboBoxText.new
                combo2.style_context.add_class("combo")
                combo2.append("t1", "1920 x 1080")
                combo2.append("t2", "1600 x 900")
                combo2.append("t3", "1280 x 720")
                combo2.append("t3", "720 x 480")

            boxBouton2 = Gtk::ButtonBox.new(:horizontal)
            @border2 = Gtk::Frame.new()
            boxBouton2.set_border_width(10)
            textBox2 = Gtk::Label.new("Taille de la fenêtre :")
            #bouton2 = Gtk::Button.new()
            #bouton2.set_label("1920 x 1080")
            #bouton2.signal_connect "clicked" do |_widget|
                # TODO
            #end
            boxBouton2.add(textBox2)
            #boxBouton2.add(bouton2)
            boxBouton2.add(combo2)
            @border2.add(boxBouton2)

        # Selection de l'autocomplétion 
            boxBouton3 = Gtk::ButtonBox.new(:horizontal)
            @border3 = Gtk::Frame.new()
            boxBouton3.set_border_width(10)
            textBox2 = Gtk::Label.new("Autocomplétion : ")
            bouton3 = Gtk::CheckButton.new()
            bouton3.set_label("")
            bouton3.set_active true
            bouton3.set_can_focus false
            bouton3.signal_connect("clicked") do |w|
                on_clicked(w)
            end
            boxBouton3.add(textBox2)
            boxBouton3.add(bouton3)
            @border3.add(boxBouton3)
        
        # Validation des parametres
            @bouton4 = Gtk::Button.new()
            @bouton4.set_label("Valider")
            @bouton4.signal_connect "clicked" do |_widget|
                # TODO
                if(combo2.active_text() != nil)
                    gMenu.changerTaille(combo2.active_text())
                end
                if(combo.active_text() != nil)
                    gMenu.changerTheme(combo.active_text())
                end
            end

    end

    def on_clicked sender

        if sender.active?
            #TODO
        else
           #TODO
        end
    end

    def afficheToi()
        @vBox1.add(@button)
        @vBox2.set_width_request($longListe)
        @vBox2.add(@titre)
        @vBox2.pack_start(@border, :expand => true, :fill => true, :padding => 0)
        @vBox2.pack_start(@border2, :expand => true, :fill => true, :padding => 0)
        @vBox2.pack_start(@border3, :expand => true, :fill => true, :padding => 0)
        @vBox2.pack_end(@bouton4, :expand => true, :fill => true, :padding => $paddingBouton)
        @hBox.add(@vBox1)
        @hBox.pack_end(@vBox2, :expand => true, :fill => true, :padding => 0)
    end

    def enleveToi()
        @hBox.remove(@vBox1)
        @hBox.remove(@vBox2)
    end
    
    def to_s()
        return "Parametres"
    end
end
