=begin
====================================================
Realizar una funcion polimorfica haciendo uso de UT.
====================================================
=end

=begin
Notese que una funcion polimorfica es aquella que puede hacer uso de cualquier tipo de dato y su funcionamiento va a seguir siendo el mismo,
es decir, dicha funcion podra ser usada con cualquier tipo de dato y seguira funcionando de manera correcta.

Debido a que se trata de la metodologia de desarrollo software UT, realizamos primero la implementacion del codigo, para despues crear las
pruebas o los tests asociados a dicha implementacion.

Fichero: lib/poliformismoRestaurador.rb
=end

def funcion_polimorfica_restaurador(cooperativa = [])
    cooperativa.collect { |restaurador| restaurador + (restaurador.mark(0) + restaurador.mark(1)).abs }
end

# Se debe de redefinir la funcion suma ya que esta se presenta como la opcion para que la funcion sea polimorfica de manera real
def +(other)
    Cooperativa.new(....., @conjunto_restauradores.collect { |restaurador| restaurador + other })
end

=begin
Haciendo uso de todo esto anterior, se tiene en cuenta que gracia al overriden del operador de suma, se permite hacer uso de cualquier tipo
de dato y que la funcion polimorfica funcione de manera correcta.

Finalmente realizamos la implementacion de las pruebas que permiten comprobar el funcionamiento de la funcion polimorfica anterior.

Fichero: test/tc_poliformismoRestaurador.rb
=end

require 'test/unit'

class PoliformismoRestauradoTest < Test::Unit::TestCase
    def setup
        #code
    end

    def test_simple
        assert_equal(...)
    end
end

=begin
Una vez se tienen desarrolladas las pruebas como se puede observar anteriormente, para la ejecucion de estas, se tiene la implementacion
del siguiente fichero Rakefile que permite la ejecucion de las pruebas cuando se quiera.

Fichero: Rakefile
=end

task :default => :test_poliformismo_restaurador

desc "Lanzamiento de la bateria de pruebas relativas a la comprobacion del funcionamiento de la funcion polimorfica"

task :test_poliformismo_restaurador do
    sh "ruby -I. test/tc_poliformismoRestaurador.rb"
end