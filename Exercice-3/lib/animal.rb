=begin
En este fichero se encuentra la implementación de la clase animales, que son los elementos que se encuentran dentro de la granja.
=end

module Universo
    class Animales
        attr_accessor :identificador, :tipo, :precio
        def initialize(identificador, tipo, precio)
            if identificador.is_a? Integer
                @identificador = identificador
            else
                raise ArgumentError, "El identificador del animal tiene que ser un numero entero"
            end

            if tipo.is_a? String
                @tipo = tipo
            else
                raise ArgumentError, "El tipo de animal tiene que ser una cadena"
            end

            if precio.is_a? Numeric
                @precio = precio
            else
                raise ArgumentError, "EL precio del animal puede ser un entero o un flotante"
            end
        end

        def to_s
            "Identificador: #{@identificador}, Tipo: #{@tipo}, Precio: #{@precio}"
        end
    end
end