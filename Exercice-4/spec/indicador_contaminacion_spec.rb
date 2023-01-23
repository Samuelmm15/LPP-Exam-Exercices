=begin
En este fichero se encuentra la implementación de las espectativas relativas a el desarrollo de la función de orden superior.
=end

require_relative '../lib/Indicador_contaminacion'

RSpec.describe Universo::IndicadorContaminacion do
    before :all do
        # Creacion de animales
        @vaca = Universo::Animales.new(123456789, 'Mamifero', 13.2)
        @lagarto = Universo::Animales.new(987654321, 'Reptil', 20)
        @pez = Universo::Animales.new(123456788, 'Pez', 1)
        # Conjunto de animales
            @conjunto_animales = [@vaca, @lagarto, @pez]
        # Creacion de Granjas
            @Granja_1 = Universo::Granja.new('Pepe', :carbono, @conjunto_animales)
            @Granja_2 = Universo::Granja.new('Luix', :hidrica, @conjunto_animales)
        # Creación del conjunto de Granjas
            @conjunto_granjas = [@Granja_1, @Granja_2]
        # Creación de la cooperativa de granjas
            @cooperativa_LNZ = Universo::Cooperativa.new(@conjunto_granjas)
    end
    context "Comprobación de la existencia de la función o el módulo que contiene la función de orden superior" do
        it "Existencia del módulo que contiene la función de orden superior" do
            expect(Universo::IndicadorContaminacion).not_to eq(true)
        end
    end
    context "Comprobación del funcionamiento de la función de orden superior" do
        it "Comprobación del funcionamiento de la función de orden superior" do
            expect(Universo::IndicadorContaminacion(@conjunto_granjas)).to eq(1)
            expect(Universo::IndicadorContaminacion(@conjunto_granjas)).to eq(2)
        end
    end
end