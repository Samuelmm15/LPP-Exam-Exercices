# Realización de las espectativas de manera previa a la implementación del código asociado, junto con su commit asociado.

require './lib/animal'

RSpec.describe Animales do
    before :all do
        # Creacion de animales
            @vaca = Animales.new(123456789, 'Mamifero', 13.2)
            @lagarto = Animales.new(987654321, 'Reptil', 20)
            @pez = Animales.new(123456788, 'Pez', 1)
    end

    context "Comprobación de la instanciación de Objetos" do
        it "Comprobación de la instancia de Objetos de tipo Animal" do
            expect(Animales.new(123456789, "Mamifero", 13.2)).not_to eq(nil)
        end
        it "Comprobación de los getters de los atributos de los animales" do
            expect(@vaca.identificador).to eq(123456789)
            expect(@lagarto.tipo).to eq("Reptil")
            expect(@pez.precio).to eq(1)
        end
        it "Comprobación de los errores de los atributos" do
            expect{Animales.new("123456789", "Mamifero", 13.2)}.to raise_error(ArgumentError)
            expect{Animales.new(123456789, 12, 13.2)}.to raise_error(ArgumentError)
            expect{Animales.new(123456789, "Mamifero", "1")}.to raise_error(ArgumentError)
        end
    end
end