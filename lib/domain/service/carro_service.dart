import 'package:flutter_estudos/domain/carro.dart';

class CarroService {
  static List<Carro> getCarros() {

    /**
     * onde se cria os elementos da lista
     */
    final carros = List.generate(50, (idx){
        return Carro("Ferrari $idx", "http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png");
    });

    return carros;
  }
}