# Este fichero contiene la implementación de los animales que recibirá la clase granja como parámetro.
# Nótese que no se hace uso de un módulo que cotenga las distintas clases y funciones ya que no se indica que se haga uso de esto.

# Hay que tener en cuenta que ya que no se hace uso de modulo se deben de incluir los distintos ficheros para poder poder realizar la herencia en el caso de que se quiera realizar herencia.
# require 'farm'

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
