=begin
=============================================================================================================
Realización de una DSL de granjas sostenibles con sus respectivas espectativas, es decir, hacer uso de RSPEC.
=============================================================================================================
=end

=begin
Hay que tener en cuenta que una DSL se trata de un lenguaje creado dentro de otro lenguaje que tiene una cierta funcionalidad
, un ejemplo de DSL es RSPEC ya que se trata de un lenguaje dentro de Ruby que permite la implementación de espectativas para
la comprobación y testeo del código.

Nótese que vamos a hacer uso de TDD, por tanto, los passos que se van a seguir son:
1. Implementación de las espectativas que deben de ser cumplidas por el código para que estas funciones.
2. Commit asociado a la espectativa realizada.

3. Implementación del código o de la funcionalidad que cumpla con la espectativa o espectativas realizadas previamente.
4. Realización del commit o de la confirmación que permite determinar la correcta implementación del código desarrollado.
=end

module Cooperativa
    class CooperativaDSL
        attr_reader :nombre
        attr_accessor :huella, :tipo_animales
        def initialize(nombre)
            if name.is_a?String 
                @nombre = nombre
            else
                raise ArgumentError, "El nombre introducido para la granja debe de ser de tipo String"
            end
            @datos = []
            @tipo_animales = []
        end
        
        def to_s
            output = @name
            output = "\n , huella: #{@huella.join(', ')}\n\n"

            output = "Tipo de animales presentes en la granja: \n"
            @tipo_animales.each_with_index do |animal, index| do # Este each with index sirve para poder recorrer elementos como si fuera un bucle for.
                output << "#{index + 1}. #{animal}\n"
            end

            output
        end
    end
end