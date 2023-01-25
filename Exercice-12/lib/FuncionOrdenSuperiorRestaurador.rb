=begin
========================================================================================================================================
Realizar una función de orden superior que permita decrementar en un facto o en una unidad la cantidad de horatizas de los restauradores
de una cadena, usando programación funcional. Además se hará uso de RSPEC para la implementación de esto.
========================================================================================================================================
=end

=begin
Nótese que de manera general se solicita el empleo de TDD, este, se basa en una metodología de desarrollo software que tiene la característica
de la implementación de las pruebas o las espectativas de manera previa a la implementación del código. Esta espectativa fallará en un comienzo, por tanto
posteriormente se deberá de desarrollar el código en torno al cumpliendo de estas espectativas.

Se solicita para este ejercicio la implementación de una función de orden superior, esta tiene la característica de que no modifica los valores
de variables externas, además, puede recibir como parámetro una función y devolver como resultado otra función.
=end

=begin
Comenzamos con el desarrollo de la o las espectativas que fallarán en un comienzo, ya que, después serán cumplidas por el código que será desarrollado
en torno al cumplimiento de dichas espectativas. Para ello, hacemos uso de RSPEC.

Fichero: spec/FuncionOrdenSuperiorRestaurador_spec.rb
=end

require 'lib/FuncionOrdenSuperiorRestaurador'

RSpec.describe FuncionOrdenSuperiorRestauradorTest do
    before :all do
        @restaurador_isabel = Restaurador.new(...)
        @restaurador_juan = Restaurador.new(...)
    end

    context "Comprobacion de la existencia de la funcion de orden superior" do
        it "Comprobacion de la existencia de la funcion de orden superior" do
            expect(decrementar_hortalizas).not_to eq(nil)
        end
    end
end

=begin
Implementacion del codigo que permite cumplir con la espectativa anteriormente especificada.

Fichero: lib/funcionOrdenSuperiorRestaurador.rb
=end

def decrementar_hortalizas()
end

=begin
Creamos la espectativa que permite comprobar el funcionamiento de la funcion de orden superior.

Fichero: spec/FuncionOrdenSuperiorRestaurador.rb
=end

context "Comprobacion del funcionamiento de la funcion de orden superior" do
    it "Comprobacion del funcionamiento de la funcion de orden superior" do
        expect(decrementar_hortalizas(@restaurador_isabel)).to eq(21)
        expect(decrementar_hortalizas(@restaurador_juan)).to eq(20)
    end
end

=begin
Finalmente desarrollados el codigo que permite cumplir con las espectativas especificadas anteriormente.

Fichero: lib/FuncionOrdenSuperiorRestaurador.rb
=end

def decrementar_hortalizas(restaurador)
    restaurador.conjunto_hortalizas.collect { |hortaliza| hortaliza.cantidad - 1 }
end

=begin
Para finalizar, para poder ejecutar el fichero de espectativa se tiene el siguiente codigo de tareas implementado en el Rakefile

Fichero: Rakefile
=end

task :default => :test_decrementar

desc "Lanzamiento de la bateria de pruebas para comprobar la funcion de orden superior"

task :test_decrementar do
    sh "rspec spec/FuncionOrdenSuperiorRestaurador_spec.rb --format documentation"
end