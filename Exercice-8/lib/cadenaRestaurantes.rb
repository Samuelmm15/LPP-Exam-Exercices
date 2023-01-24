=begin
===============================================================================================================================
Una cadena de restaurantes está compuesta por un conjunto de Restauradores. Haciendo uso de programación funcional, implementar
una función de orden superior para calcular el valor máximo del número de elaboraciones de los restaurantes que conforman
una cadena. Hacer uso de UT (Unit Test).
===============================================================================================================================
=end

=begin
Estructura general de la clase Restaurador:
Restaurador(identificador, tipo_de_servicio(local, nacional), conjunto_horatilzas(nombre, temporada, cantidad, número, elaboraciones)).
=end

=begin
Ya que se hace uso de UT como metodología de desarrollo software, se puede especificar que primero se realiza la implementación del código, y a
continuación se desarrolla el test necesario para comprobar el funcionamiento de dicho código o función desarrollada de manera previa.
=end

=begin
Primero realiza la implementación de la función de orden superior en el fichero `lib/funcionOrdenSuperior.rb`, es por ello que se puede destacar
que una función de orden superior es aquella que no modificar el valor de las variables que son externas a estas, además, puede recibir una
función como parámetro y devolver otra función como resultado.
=end

module Actividad_ecologica
    def numero_maximo_elaboraciones(cadena = [])
        cadena.collect { |restaurador| restaurador.elaboraciones}.max
    end
end

=begin
Una vez tenemos desarrollada la implementación anterior para obtener el número máximo de elaboaraciones de una cadena introducida como
parámetro, implemetamos su test asociado en el fichero `test/tc_funcionOrdenSuperior.rb`:
=end

require 'lib/funcionOrdenSuperior'
require 'test/unit'

class TestFuncionOrdenSuperior < Test::Unit::TestCase
    def setup
        @restaurador_1 = Actividad_ecologica::Restaurador.new(...)
        @restaurador_2 = Actividad_ecologica::Restaurador.new(...)
        @restaurador_3 = Actividad_ecologica::Restaurador.new(...)
        @cadena = [@restaurador_1, @restaurador_2, @restaurador_3]
    end

    def test_funcion_orden_superior
        assert_eq(numero_maximo_elaboraciones(@cadena), @restaurador_2)
    end
end

=begin
Para la ejecución del test anterior realizamos la implementación del siguiente Rakefile:
=end

task :default => :test_funcion_orden_superior

desc "Batería de pruebas para poder comprobar la funcionalidad"

task :test_funcion_orden_superior do
    sh "ruby -I. test/tc_funcionOrdenSuperior.rb"
end
