=begin
==============================================================================================================================================================
Una cooperativa es un conjunto de granjas sostenibles, se debe de hacer uso de UT (Unit Test) para el testeo y la comprobación del programa.
Es por ello que se solicita la implementación de una función de orden superior la cual se encarga de comprobar todas las granjas que se encuentran dentro de la 
cooperativa y permite obtener la granja más sotenible.
==============================================================================================================================================================
=end

=begin
Nótese que se solicita la implementación de una función de orden Superior haciendo uso de UT(Unit Test), este se trata de una metodología de desarrollo software
que se basa principalmente en la implementación del código del programa, posteriormente se realiza un commit asociado a dicha implementación. Finalmente se realiza
la implementación de la prueba o el test asociado a la implementación de dicho código, junto con su commit asociado.

De manera general se tiene que:
1. Implementación del código.
2. Commit asociado a la implementación del código.
3. Implementación del test correspondiente con el código desarrollado.
4. Commit relativo al test.

Ya que se está haciendo uso de Unit Test, se tiene en cuenta que el código de implementación se encuentra dentro del directorio /lib, mientras que los tests
correspondientes se encuentran dentro del directorio /test.

Nótese que como una cooperativa se trata de un conjunto de granjas, se hace uso del módulo Enumerable y Comparable como un MixIn para poder realizar la implementación de
la función de comparación de los distitnos objetos y poder obtener la Granja más sostenible de todas.

Última anotación, se hará uso de un módulo, para poder repasar el funcionamiento de los módulos en Ruby.
=end

module Universo
    class Cooperativa
        attr_accessor :conjunto_granjas
        def initialize(conjunto_granjas)
            @conjunto_granjas = conjunto_granjas
        end

        def to_s
            "Conjunto de granjas que conforman la cooperativa: #{@conjunto_granjas}"
        end
        
        def mas_sostenible(conjunto_granjas_comprobar)
            conjunto_granjas_comprobar.min { |g1, g2| g1.mark.reduce{ |x, y| x + y} <=> g2.mark.reduce{ |x, y| x + y}}.name
        end
    end
end



