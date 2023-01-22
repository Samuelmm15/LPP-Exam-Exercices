=begin
==========================================================================================================================================================================
Desarrolle con Unit Testing la clase Sotenible, que representa una granja sostenible. La granja debe de tener un identificador que almacenara el nombre de la granja,
un conjunto de valores correspondientes a sus huellas, de carbono, huella hidrica y un conjunto de animales (Identificador, tipo y precio). Descripcion de la jerarquia de 
clases y estructura de directorio.
==========================================================================================================================================================================
=end

=begin
Hay que tener en cuenta que para la resolución de esto, se tendrá una clase granja y una clase animales, Cada una para la representación de una granja y los otros para
la representación de los animales que recibirá la granja.

Hay que tener en cuenta que se debe de hacer uso de UT (Unit Test) es decir, tests unitarios que permiten establecer que primero se realiza la implementación
del código, se realiza un commit relacionado con el código y posteriormente se realiza la implementación del test asociado al código implementado previamente, junto
con su commit asociado.
=end

=begin
Como se puede observar, primero se crea la clase Animal, la cual permite tener e identificar a los distintos animales, es por ello que una vez se tiene el código de la clase
se pasa a el desarrollo de la prueba de código asociada a esta, una vez se tiene esta prueba, se pasa a la implementación de la clase granja.
Nótese que entre cada uno de ellos se realiza un commit asociado con lo desarrollado, es decir, una confirmación tras el desarrollo del código y otra después de la comprobación
de la prueba.
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