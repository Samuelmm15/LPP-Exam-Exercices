=begin
En este fichero se lleva a cabo la implementación de las espectativas que deberán de ser creadas previamente a la implementación del código
para que puedan ser cumplidas posteriormente por este
=end

require 'lib/Sostenible'
require 'lib/CooperativaDSL'

RSpec.describe DSLTest do
    before :all do
        @granja_1 = Cooperativa::CooperativaDSL.new("Granja 1")
        @granja_1.huella << "Peo"
        @granja_1.huella << "Escremento"
        @granja_1.tipo_animales << "Vaca"
        @granja_1.tipo_animales << "Perro"
        @granja_1.tipo_animales << "Mula"
    end

    context "Creación de los objetos o existencia de estos de manera previa" do
        it "Comprobación de la existencia de la clase Granja sostenible" do
            expect(Cooperativa::Granja).not_to eq(nil)
        end
        it "Comprobación de la existencia de la clase o función DSL de la granja" do
            expect(Cooperativa::CooperativaDSL).not_to eq(nil)
        end
    end

    context "Comprobación del funcionamiento de la DSL de manera correcta" do
        it "Comprobación del método to_s que permite determinar si funciona de manera correcta el DSL" do
            expect(@granja_1.to_s).to eq("Salida Correcta")
        end
    end
end