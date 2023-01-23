=begin
Aquí se encuentra la implementación de la granja que es necesaria para poder implementar la función de orden superior de la cooperativa de granjas.
=end

module Universo
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
end