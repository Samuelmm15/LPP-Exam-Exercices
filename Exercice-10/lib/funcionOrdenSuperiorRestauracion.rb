=begin
======================================================================================================================
Realización de una función de orden superior que permita decrementar en un factor la cantidad de las hortalizas de los
restauradores de una cadena usando programación funcional. Hacer uso de RSPEC para su implementación.
======================================================================================================================
=end

=begin
RSPEC hace uso de un tipo de metodología de desarrollo software denominada (TDD), esta se basa principalmente en 
la implementación de las espectativas de código de manera previa a la implementación de este, generando que este
último sea desarrollado de manera que se puedan arreglar estos fallos y cumpliendo las espectativas de implementación
de código.

Nótese que se solicita la implementación de una función de orden superior, esta, de manera general se trata de una función
la cual no modifica las variables externas a dicha función, además puede recibir una función y devolver una función como
resultado de esta.
=end

=begin
Para comenzar, se realiza la implementación de la espectativa que compruebe si existe la función de orden superior, 
esta en un comienzo genera un fallo ya que, la función de orden superior todavía no ha sido creada.

Fichero: spec/funcionOrdenSuperiorRestauracion_spec.rb
=end

RSpec.describe FuncionOrdenSuperiorRestauracionTest do
    before :all do
        @restaurador_1 = Restaurador.new(...)
        @restaurador_2 = Restaurador.new(...)
        @restaurador_3 = Restaurador.new(...)
        @cadena = [@restaurador_1, @restaurador_2, @restaurador_3]
    end

    context "Comprobación de la existencia de la función de orden superior" do
        it "Existencia de la función de orden superior" do
            expect(decrementar_hortalizas).not_to eq(nil)
        end
    end
end

=begin
Una vez se tiene la espectativa se desarrolla el código que permite cumplir con dicha espectativa

Fichero: lib/funcionOrdenSuperiorRestauracion.rb
=end

def decrementar_hortalizas(cadena)
end

# Se a cumplido la espectativa anteriormente desarrollada, por tanto se realiza la espectativa necesaria para la comprobación de la función
# de orden superior

context "Comprobación del funcionamiento de la función de orden superior" do
    it "Decrementar el número de hortalizas de un restaurador" do
        expect(decrementar_hortalizas(@cadena)).to eq(...)
    end
end

=begin
Implementación del código de la función de orden superior que permite cumplir con la espectativa especificada anteriormente.

Hay que tener en cuenta que de manera general la estructura general de la clase Restaurador es:
Restaurador(identificador, tipo_servicio, conjunto_hortalizas(nombre, temporada, cantidad, numero_elaboraciones))
=end

def decrementar_hortalizas(cadena)
    cadena.collect { |restaurador|  restaurador.conjunto_hortalizas.collect { |hortalizas| hortalizas.cantidad - 1 }}
end

=begin
Como se puede observar con la implementación anterior se cumple con la espectativa original, es por ello que se puede observar
a continuación la implementación del Rakefile que permite ejecutar las espectativas:
=end

task :default => :test_funcion_orden_superior

desc "Ejecución de las espectativas relativas a la implementación de la función de orden superior"

task :test_funcion_orden_superior do
    sh "rspec spec/funcionOrdenSuperior_spec.rb --format documentation"
end