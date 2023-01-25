=begin
=================================================================================================================
Haciendo uso de dos hilos en el que los restauradores puedan poner y quitar toda su informacion de un escaparate.
=================================================================================================================
=end

=begin
De manera general un hilo es un proceso ligero que se ejecutan de manera independiente y pueden compartir recursos con su padre.

Fichero: lib/hilosRestaurador.rb
=end

require 'thread'

# Tener en cuenta que la estructura para esto siempre es la misma
mutex = Mutex.new
CV = ConditionVarible.new
obj = Restaurador.new(...)
escaparate = []

# Tener en cuenta la estructura de esto
hilo_1 = Thread.new {
    mutex.synchronize {
        CV.wait(mutex)
        puts "Se elimina un elemento del escaparate"
        esparate.pop
    }
}

# Tener en cuenta la estructura de esto
hilo_2 = Thread.new {
    mutex.synchronize {
        puts "Anadimos un nuevo elemento al escaparate"
        escaparate <<< obj
        CV.signal
    }
}

=begin
Finalmente para que los hilos puedan ejecutarse y funcionar, se debe de hacer uso de las distintas operaciones.

Fichero: lib/hilosRestaurador.rb
=end

hilo_1.join
hilo_2.join