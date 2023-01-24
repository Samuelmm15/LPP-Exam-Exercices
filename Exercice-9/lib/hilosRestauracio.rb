=begin
====================================================================================================================
Creación de dos hilos que permitan que los restauradores puedan poner y quitar toda su información de un escaparate.
====================================================================================================================
=end

=begin
De manera general los hilos son procesos ligeros que permiten ejecutar programas o funcionalidades en Ruby, teniendo en cuenta
que se pueden compartir recursos o no, dependiendo de la utilidad que se les quiera dar.
=end

# Primero nos encargamos de implementar el código de ambos hilos para poder lanzarlos mediante la operación join. Esta implementación
# la llevamos a cabo dentro del fichero `lib/hilosRestauracion.rb`.

require 'lib/restaurador'
require 'thread'

mutex = Mutex.new
CV = ConditionVariable.new
obj = Restaurador.new(...)
escaparate = [] # Tenemos en cuenta que un escaparate es un conjunto de elementos

hilo_1 = Thread.new {
    mutex.synchronize {
        CV.wait(mutex)
        puts "Retiro una hortaliza del escaparate"
        puts escaparate
        escaparate.pop
    }
}

hilo_2 = Thread.new {
    mutex.synchronize {
        puts "Pongo una hortaliza en el escaparate"
        escaparate << obj
        puts escaparate
        CV.signal
    }
}

# Una vez se tiene realizada la implementación de los dos hilos necesarios, se realiza la ejecución de estos de manera:

hilo_1.join
hilo_2.join
