# Creamos las espectativas del código de la granja sostenible antes de la implemantación del código asociado.

require './lib/animal'
require './lib/sostenible'

RSpec.describe Granja do
    before :all do
        # Creacion de animales
            @vaca = Animales.new(123456789, 'Mamifero', 13.2)
            @lagarto = Animales.new(987654321, 'Reptil', 20)
            @pez = Animales.new(123456788, 'Pez', 1)
        # Conjunto de animales
            @conjunto_animales = [@vaca, @lagarto, @pez]
        # Creacion de Granjas
            @Granja_1 = Granja.new('Pepe', :carbono, @conjunto_animales)
            @Granja_2 = Granja.new('Luix', :hidrica, @conjunto_animales)
    end

    context "Comprobación de la instanciación de los distintos objetos de la clase Granja" do
        it "Comprobación de la instancia de objetos" do
            expect(Granja).not_to eq(nil)
        end
        it "Comprobación de los getters de los elementos principales de la clase" do
            expect(@Granja_1.identificador).to eq("Pepe")
            expect(@Granja_2.huellas).to eq(:hidrica)
        end
        it "Comprobación de los posibles errores en los atributos de la clase" do
            expect{Granja.new(123, :carbono, @conjunto_animales)}.to raise_error(ArgumentError)
            expect{Granja.new('Pepe', :peep, @conjunto_animales)}.to raise_error(ArgumentError)
        end
    end

    context "Comprobación del método to_s" do
        it "Impresión de los distintos atributos de los animales por pantalla" do
            expect(@vaca.to_s).to eq("Identificador: 123456789, Tipo: Mamifero, Precio: 13.2")
        end
    end
end