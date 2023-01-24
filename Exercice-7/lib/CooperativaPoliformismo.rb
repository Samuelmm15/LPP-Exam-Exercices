=begin
==========================================================================================================
Una cooperativa es un conjunto de granjas sostenibles, haciendo uso de UT, hacer uso del poliformismo para
incrementar el precio de compra de manera que el factor es la diferencia de huellas.
==========================================================================================================
=end

=begin
Debido a que se hace uso de UT como metodología de desarrollo de software, se tiene en cuenta que esta metodología se basa principalmente
en el desarrollo del código, junto con su commit asociado, y, posteriormente se realiza la implementación de la prueba o el test que se
encarga de comprobar y confirmar el correcto funcionamiento de dicha prueba.

Nótese que se solicita el empleo de poliformismo, este, de manera general se basa principalmente en una función, método o clase, la cúal
puede hacer uso de cualquier tipo de dato y su funcionamiento se produce de manera correcta si  necesidad de que no funcione teniendo en cuenta
que no se hace uso del tipo de dato para el cuál fue implementado.
=end

=begin
Nótese que para la implementación del poliformismo, hay que tener en cuenta que se debe de poder hacer con cualquier tipo de dato el cual sea pasado
=end

# Primero creamos la función en el fichero `lib/poliformismo.rb` incrementar la cuál se encarga de comprobar e incrementar los precios de las granjas de la cooperativa

module Cooperativa
    def incrementar(conjunto_granjas = [])
        if cooperativa.all?(sostenible)
            return conjunto_granjas.collect { |granja| granja + (granja.mark(0) + granja.mark(1)).abs }
        else
            return nil
        end
    end
end

# Creamos la pureba o el test asociado en el fichero `test/tc_poliformismo.rb` el cual se encarga de comprobar el funcionamiento de dicha función.

require 'lib/poliformismo.rb'
require 'test/unit'

class IncrementarTest < Test::Unit::TestCas
    def setup
        @granja_1 = Granja.new(...)
        @granja_2 = Granja.new(...)
        @granja_3 = Granja.new(...)
        @cooperativa = [@granja_1, @granja_2, @granja_3]
    end

    def test_incrementar
        assert_eq(Cooperativa::incrementar(@cooperativa), [1,2,3])
    end
end

# Finalmente realizamos la sobrecarga del operador suma para poder sumar e implementar cualquier tipo de dato y que la función sea polimorfica

module Cooperativa
    def +(other)
        Sostenible.new(@nombre, @mark, @animals.collect { |animal| [animal[0], animal[1], animal[2] + other]})
    end
end

# Llevamos a cabo su test para comprobar el funcionamiento de la funcionalidad implementada

def test_suma
    assert_eq(@granja_1 + @granja_2, 2)
end

# Para finalizar podemos observar a continuación la implementación del fichero Rakefile que permite la ejecución de dichos tests

#Rakefile:
task :default => testIncrementar

desc "Ejecución de la batería de pruebas relacionadas con la función polimórfica solicitada"

task :testIncrementar do
    sh "ruby -I. test/tc_poliformismo.rb"
end