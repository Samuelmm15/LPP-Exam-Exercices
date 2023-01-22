=begin
Estas son las pruebas relativas a la implementación de la clase granja. Nótese que previamente se ha realizado el código y un commit asociado a dicho código.
=end

require 'lib/farm'
require 'lib/animals'
require 'test/unit'

class TestFarm < Test::Unit::TestCase
    def setup
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

    def test_simple
        assert_equal("Luix", @Granja_2.identificador)
        assert_equal(:carbono, @Granja_1.huellas)
        assert_not_equal(:carbono, @Granja_2.huellas)
        assert_equal([#<Animales:0x00005615ebbcb9a0
            @identificador=123456789,
            @precio=13.2,
            @tipo="Mamifero">,
           #<Animales:0x00005615ebbcb900
            @identificador=987654321,
            @precio=20,
            @tipo="Reptil">,
           #<Animales:0x00005615ebbcb8b0
            @identificador=123456788,
            @precio=1,
            @tipo="Pez">], @Granja_1.conjunto_animales)
    end
end