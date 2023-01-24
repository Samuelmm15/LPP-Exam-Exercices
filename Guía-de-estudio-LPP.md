
# Anotaciones importantes para la correcta programación mediante Ruby

## Estructura general de los directorios según el tipo de metodología de desarrollo software usado

- Si se hace uso de UT (Unit test):

Se debe de tener la estructura de directorios formada por `/lib` para el código de implementación y `/test` para las pruebas. Nótese que
de manera general se tiene que los ficheros del directorio de tests tiene que tener la estructura de `tc_testname.rb`.

Hay que tener en cuenta que para programar los tests, en el fichero de tests se tienen que incluir los ficheros que contienen la especificación
de las clases o de las funciones las cuales se van a hacer uso. Además para UT se debe de incluir la línea `require 'test/unit'`. Posteriormente un
ejemplo de creación de una prueba es:

```(Ruby)
class TestName < Test::Unit::TestCase
    def setup # Este es el método que se encarga de inicializar las variables
        # code
    end
    
    def test_name   # creación del test con su respectivo código
        assert_equal()
        assert_not_equal()
    end
end
```

Anotación: para los require, existe un tipo de require que es require_relative, que en vez de poner la dirección del directorio de manera absoluta
la puedes poner de manera relativa.

- Si se hace uso de rspec para las pruebas:

Se debe de tener en cuenta que la estructura de los directorios del código es de la manera `/lib` para la implementación del código del programa y
`/spec` para las pruebas o especatativas del código. De manera general la estructura del nombre de los ficheros de pruebas es `testName_spec.rb`.

De manera general para la creación de un fichero de espectativas, se hace de la manera:

```(Ruby)
RSpec.describe TestName do
    before :all do # Especificación de todo aquello que se quiere crear antes de la ejecución de las pruebas
        #code
    end

    context "Comment" do
        it "Comment" do
            expect().to eq()
            expect().not_to eq()
        end
    end
end
```

## Creación de un Rakefile

De manera general para la creación de tests mediante `UT`:

```(Ruby)
task :default => :testName

desc "Comment"

task :testName do
    sh "ruby -I. test/tc_testName.rb"
end
```

De manera general para la creación de tests mediante `TDD`:

```(Ruby)
task :default => :testName

desc "Comment"

task :testName do
    sh "rspec spec/testName_spec.rb --format documentation"
end
```

## Anotaciones principales para la creación de `funciones de Orden Superior`

Las funciones de `orden superior` son aquellas que no modifican las variables que son externas a estas, además, pueden recibir
una función como parámetro y devolver una función a su vez.

### Principales elementos para la creación de funciones de orden superior

# Programa con los ejemplos del Modulo Enumerable en Ruby

collect { |obj| block } → array
collect → an_enumerator
Retorna un nuevo array con el resultado de ejecutar el bloque en cada elemento.
Si no se le pasa un bloque, se devuelve un enumerador.
Aqui un ejemplo:

```(Ruby)
(1..4).collect { |i| i*i }      #=> [1, 4, 9, 16]
(1..4).collect { "cat"  }   #=> ["cat", "cat", "cat", "cat"]
```

find(ifnone = nil) { |obj| block } → obj or nil
find(ifnone = nil) → an_enumerator
Pasa cada entrada en enum al bloque. Devuelve la primera para la cual el bloque no es falso.
Si no hay ningún objeto que coincida, llama a ifnone y devuelve su resultado cuando está especificado,
o devuelve nil de lo contrario.
Si no se da ningún bloque, se devuelve un enumerador en su lugar.
Aqui un ejemplo:

```(Ruby)
(1..10).find { |i| i % 5 == 0 and i % 7 == 0 }   #=> nil
(1..100).find { |i| i % 5 == 0 and i % 7 == 0 } #=> 35
```

include?(obj) → true or false
Devuelve true si cualquier miembro de enum es igual a obj.
Aqui un ejemplo:

```(Ruby)
(1..5).include?(3)   #=> true
(1..5).include?(6)   #=> false
(1..5).include?(3.0) #=> true
```

map { |obj| block } → array
map → an_enumerator
Retorna un nuevo array con el resultado de ejecutar el bloque en cada elemento.
Aqui un ejemplo:

```(Ruby)
(1..4).map { |i| i*i }      #=> [1, 4, 9, 16]
(1..4).map { "cat"  }   #=> ["cat", "cat", "cat", "cat"]
```

max → obj
max { |a, b| block } → obj
max(n) → array
max(n) { |a, b| block } → array
Devuelve el objeto en enum con el valor máximo. El criterio para el valor máximo es determinado por
el bloque de comparación opcional. Si no se da ningún bloque, se comparan los elementos usando el operador <=>
Aqui un ejemplo:

```(Ruby)
(5..10).max                                   #=> 10
(5..10).max { |a, b| a <=> b }                #=> 10
(5..10).max { |a, b| b <=> a }                #=> 5
(5..10).max(3)                                #=> [8, 9, 10]
(5..10).max(3) { |a, b| a <=> b }             #=> [8, 9, 10]
(5..10).max(3) { |a, b| b <=> a }             #=> [10, 9, 8]
```

min → obj
min { |a, b| block } → obj
min(n) → array
min(n) { |a, b| block } → array
Devuelve el objeto en enum con el valor mínimo. El criterio para el valor mínimo es determinado por
el bloque de comparación opcional. Si no se da ningún bloque, se comparan los elementos usando el operador <=>
Aqui un ejemplo:

```(Ruby)
(5..10).min                                   #=> 5
(5..10).min { |a, b| a <=> b }                #=> 5
(5..10).min { |a, b| b <=> a }                #=> 10
(5..10).min(3)                                #=> [5, 6, 7]
(5..10).min(3) { |a, b| a <=> b }             #=> [5, 6, 7]
(5..10).min(3) { |a, b| b <=> a }             #=> [10, 9, 8]
```

select { |obj| block } → array
select → an_enumerator
Devuelve un nuevo array que contiene todos los elementos de enum para los cuales el bloque no es falso.
Si no se da ningún bloque, se devuelve un enumerador en su lugar.
Aqui un ejemplo:

```(Ruby)
(1..10).select { |i|  i % 3 == 0 }   #=> [3, 6, 9]
```

sort → array
sort { |a, b| block } → array
Devuelve un nuevo array ordenado por el valor de los elementos. El orden es determinado por el bloque de comparación opcional.
Si no se da ningún bloque, se comparan los elementos usando el operador <=>
Aqui un ejemplo:

```(Ruby)
(1..10).sort { |a, b| b <=> a }   #=> [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
(1..10).sort { |a, b| a <=> b }   #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

## Estructura general para la creación de hilos

De manera general para la creación de dos hilos, se suele hacer uso de:

```(Ruby)
require 'thread' # Librería necesaria para el uso de los hilos en Ruby

mutex = Mutex.new
CV = ConditionVariable.new
obj = Restaurador.new("123", :local, [["cebolla", :primavera, 300, 2203, 1234]])
escaparate = []

a = Thread.new {
    mutex.synchronize {
        CV.wait(mutex)
        puts "Retiro la tortilla del escaparate"
        puts escaparate
        escaparate.pop
    }
}

b = Thread.new {
    mutex.synchronize {
        puts "Pongo la tortilla en el escaparate"
        escaparate << obj
        puts escaparate
        CV.signal
    }
}

# Para que el hilo pueda funcionar, se debe de llamar a join, permitiendo establecer que el hilo funcione de manera correcta.
a.join
b.join
```

Nótese que de la manera anterior, se ejecutan los dos hilos, de manera que realicen las operaciones o elementos para los que fueron hechos.

## Estructura general para la creación de una DSL

De manera general se tiene el siguiente ejemplo para poder entender de manera general la estructura de creación de una DSL:

```(Ruby)
class Recipe
  attr_reader :name
  attr_accessor :ingredients, :instructions

  def initialize(name)
    @name = name
    @ingredients = []
    @instructions = []
  end

  def to_s
    output = @name
    output << "\n#{'=' * @name.size}\n\n"
    output << "Ingredients: #{@ingredients.join(', ')}\n\n"

    @instructions.each_with_index do |instruction, index|
      output << "#{index + 1}) #{instruction}\n"
    end

    output
  end
end

mac_and_cheese = Recipe.new("Mac and Cheese")

mac_and_cheese.ingredients << "Noodles"
mac_and_cheese.ingredients << "Water"
mac_and_cheese.ingredients << "Cheese"

mac_and_cheese.instructions << "Boil water."
mac_and_cheese.instructions << "Add noodles, boil for six minutes."
mac_and_cheese.instructions << "Drain water."
mac_and_cheese.instructions << "Mix in cheese with noodles."

puts mac_and_cheese
```

Nótese que hay que comprender que es una DSL, este se trata de un lenguaje que es creado dentro de otro lenguaje, es decir,
se trata de un lenguaje que es creado y desarrollado dentro de otro lenguaje con la finalidad de cumplir con una funcionalidad
en especifico, un ejemplo de DSL es Rspec, ya que, se trata de un lenguaje desarrollado mediante Ruby que permite la ejecución
de espectativas y el testeo mediante TDD, ya que este lenguaje tiene una estructura y una forma de sentencias especificas dentro de Ruby.

## Estructura del modulo Comparable

De manera general se debe de redefinir el método <=>, para poder implementar la comparación de aquello que se quiera, es por ello que se
tiene que para poder entender su funcionamiento:

```(Ruby)
def <=>(other)
    @x * @y <=> other.x * other.y
end
```

## Estructura del módulo Enumerable

De manera para el módulo enumerable, se debe de redefinir el método `each`, es por ello que se tiene que:

```(Ruby)
def each
    yield @x
    yield @y  # Hay que tener en cuenta que el yield sirve para establecer los elementos que serán recorridos de la clase en la que se implementa.
end
```

## Funcionamiento de la creación de una función polimórfica

Una función `polimórfica` es aquella la cúal independientemente del tipo de dato que se haga uso, funcionará de manera correcta, es decir,
se trata de aquellas funciones las cuales, independientemente del tipo de datos los cuales se les pasa, funcionará de manera correcta
cumpliendo con el objetivo para el cuál fue hecha.

Un ejemplo de esta función para poder entender es:

```(Ruby)

require 'pry'

# El polimorfismo es el nombre que se le da al concepto de escribir código
# que puede trabajar con objetos de múltiples tipos y clases a la vez

# Ejemplo: to_s
# Se puede iterar y trabajar sobre objetos de diferentes CLASES,
# pero se obtiene el resultado esperado en cada caso
# siempre que cada clase implemente el mismo método

# FixNum

string_numero = 1000.to_s

# Arrays

string_array = [1,2,3].to_s

# Hash

string_hash = ({:name => 'Juan', :age => 10}).to_s


# Ejemplo: el método + 
# Este método depende enteramente de qué TIPO de cosa se esté
# intentando sumar
# El método + trabaja:
#         sumando números
#         concatenando cadenas
#         uniendo arrays

n = 999 + 1

s = "hola " + "mundo"

c = [1, 2, 3] + [4, 5, 6]

binding.pry
````

Nótese que de manera general para que sea polimórfica lo más común es hacer uso de objetos para ello y redefinir el operador suma para
que funcione de manera correcta dicha función, además, también se puede establecer que se haga uso de la funcionalidad denominada `coerce`,
ya que, se encarga de transformar los datos o las variables que se le son pasadas en otro tipo de datos o variables las cuales queremos hacer uso.
