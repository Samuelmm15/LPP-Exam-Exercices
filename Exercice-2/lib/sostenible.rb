=begin
=====================================================================================================================================
Desarrollo mediante Rspec de una granja sostenible. Es la misma estructura que el ejercicio 1, por tanto la copiamos del ejercicio 1.

Pero, en este caso se hace uso de TDD, es decir, se hace uso de espectativas para la comprobación del funcionamiento del código.
Por tanto esta técnica de desarrollo se basa principalmente en la realización de las espectativas de implementación de 
código antes de la realización del código en si. Es por ello que, primero se realiza la espectativa junto con su commit
correspondiente y a continuación se realiza la implementación del código que cumple con la espectativa que ha fallado,
junto con su commit final.
=====================================================================================================================================
=end

class Granja
    attr_accessor :identificador, :huellas, :conjunto_animales
    def initialize(identificador, huellas, conjunto_animales)
        if identificador.is_a? String
            @identificador = identificador
        else
            raise ArgumentError, "El nombre de la granja debe de ser una cadena de caracteres"
        end

        if huellas == :carbono or huellas == :hidrica
            @huellas = huellas
        else
            raise ArgumentError, "Las huellas posibles de una granja son de carbono e hidricas"
        end

        @conjunto_animales = conjunto_animales
    end

    def to_s
        "Nombre de la granja: #{@identificador}, Huella: #{@huellas}, Conjunto de animales: #{@conjunto_animales}"
    end
end