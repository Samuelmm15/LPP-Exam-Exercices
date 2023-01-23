=begin
                                                                ENUNCIADO:
===============================================================================================================================================
Haciendo uso de Rspec y programación funcional. Realización de una función de orden superior para hallar el indicador de contaminación a través 
de los valores de las huellas de contaminación (Suponemos que los indicadores de las huellas son valores numéricos).
===============================================================================================================================================
=end

=begin
Hay que tener en cuenta que hacer uso de RSPEC indica que se haga uso de la metodología de desarrollo de software de TDD. Esta metodología de desarrollo
software se basa principalmente en la implementación de las pruebas o espectativas necesarias para el desarrollo del código, es decir, primero se desarrollan
las espectativas necesarias para que estas fallen y el código el programa se desarrolla a partir de estas espectativas, cumpliendo estas espectativas.

Los pasos para este tipo de metodología de desarrollo de software son:
1. Realización de las espectativas.
2. Confirmación(Commit) asociada a dichas espectativa.
3. Desarrollo del código que permite cumplir con dicha espectativa.
4. Commit asociado al código implementado.

Nótese que haremos uso de un módulo para una implementación de la función de orden superior de manera más cómoda.
=end

module Universo
    def IndicadorContaminacion(conjunto_granjas)
        conjunto_granjas.mark.reduce do |x,y|
            if x.between?(0,50) and y.between?(0,50)
                return 1
            else
                return 2
            end
        end
    end
end