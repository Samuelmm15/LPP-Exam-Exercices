=begin
En este fichero se realiza la implementación de las distitnas pruebas relativas a la implementación de la función de orden superior. Para este caso se hace uso de UT.
=end

require 'lib/animal'
require 'lib/granja'
require 'lib/cooperativa'
require 'test/unit'

class CooperativaTest < Test::Unit::TestCase
    def setup 
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

    def test_simple
        assert_not_equal(Universo::Cooperativa, nil)
        assert_not_equal(Universo::Animales, nil)
        assert_not_equal(Universo::Granja, nil)
    end
end