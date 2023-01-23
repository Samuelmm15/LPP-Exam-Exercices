=begin
                                                            ENUNCIADO:
=========================================================================================================================================
Con dos hilos en Ruby, escribir un código en Ruby en el que los restauradores puedan poner y quitar toda su información de un escaparate.
=========================================================================================================================================
=end

=begin
Los hilos son un tipo de programación la cúal no hemos realizado ningún programa, por tanto, este ejercicio se basa en intentar entender como
funciona este tipo de programación de hilos mediante Ruby.
=end

require 'lib/restaurador'
require 'thread'

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