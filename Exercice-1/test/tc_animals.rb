# Hay que tener en cuenta que lo primero que se debe de hacer es el código del programa y después se realiza el testeo relativo a este.
# Esto se debe al empleo de la metodología de UT.

# Nótese que lo primero que se debe de hacer es establecer los requires
require 'lib/animals'
require 'test/unit'

class TestAnimals < Test::Unit::TestCase
    def setup 
        @vaca = Animales.new(123456789, 'Mamifero', 13.2)
        @lagarto = Animales.new(987654321, 'Reptil', 20)
    end

    def test_simple
        assert_equal(123456789, @vaca.identificador)
        assert_equal("Reptil", @lagarto.tipo)
        assert_not_equal(12.2, @vaca.precio)
    end
end