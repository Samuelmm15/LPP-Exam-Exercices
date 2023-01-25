=begin
=================================================================================================================================================
Realizar un DSL de una cadena de Restauradores, donde, tenga cada uno de ellos su nombre propio de cadena, tenga un conjunto de Restauradores, y, 
tenga un conjunto de instrucciones para poder plantar las distintas hortalizas que presentan. Hacer uso de UT (Unit Test)
=================================================================================================================================================
=end

=begin
De manera general UT se basa en una metodología de desarrollo software que se basa principalmente en la implementación del código de manera
previa, junto con su commmit asociado, para que, posteriormente se desarrolle su prueba asociada, de manera que se encargue de comprobar
el funcionamiento de dicho código, finalmente se realiza el commit del test llevado a cabo e implementado.

Nótese que un DSL se trata de un lenguaje programado o desarrollado a partir de otro lenguaje como en este caso es Ruby, un ejemplo de
DSL puede ser RSPEC, ya que se trata de un lenguaje que permite la realización de pruebas o espectativas haciendo uso de un lenguaje
y unas características concretas que han sido desarrolladas e implementadas de manera previa mediante Ruby.
=end

=begin
Comenzamos con la implementación del código de la DSL que se encarga de contener la información o permite tener distintas cadenas de Restauradores.
Fichero: lib/DSLRestaurador.rb
=end

class RestauradoresDSL
    attr_reader :name
    attr_accessor :conjunto_hortalizas, :conjunto_instrucciones
    def initialize(name)
        if name.is_a? String
            @name = name
        else
            raise ArgumentError, "El nombre introducido como parámetro debe de ser una cadena"
        end

        @conjunto_hortalizas = []
        @conjunto_instrucciones = []
    end

    def to_s
        output = @name
        output = "\nHortaliza: #{@conjunto_hortalizas.map { |hortaliza| "#{hortaliza}: #{conjunto_instrucciones.each_with_index do |intruction, index| "#{index + 1}: #{instruction}\n"} }}"

        output
    end
end

=begin
Una vez tenemos la implementación de la DSL en este caso, realizamos el desarrollo de los tests que permiten la comprobación del correcto funcionamiento de la DSL.
Fichero: test/tc_DSLRestaurador.rb
=end

require 'lib/DSLRestaurador'
require 'test/unit'

class DSLRestauradorTest < Test::Unit::TestCase
    def setup
        @restaurador_pepe = RestauradoresDSL.new("Pepe")
        @restaurador_juan = RestauradoresDSL.new("Juan")
        @restaurador_isabel = RestauradoresDSL.new("Isabel")
        
        @restaurador_juan.conjunto_hortalizas << "Zanahoria"
        @restaurador_juan.conjunto_hortalizas << "Papa"
        @restaurador_juan.instrucciones << "Sembrar las papas"
        @restaurador_juan.instrucciones << "Coger las papas"
    end

    def test_simple
        assert_equal(@restaurador_juan.to_s, ...)
    end
end

=begin
De manera general para poder ejecutar dichas pruebas implementadas anteriormente, se debe de hacer uso de un Rakefile que permite ejecutar los tests de manera automática cuando
se lo especifiquemos.
=end

task :default => :test_simple

desc "Ejecución de la batería de pruebas relativa a la DSL creada anteriormente"

task :test_simple do
    sh "ruby -I. test/tc_DSLRestaurador.rb"
end