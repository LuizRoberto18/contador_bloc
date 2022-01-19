import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

//a classe BlocBase vem da dependdencia bloc_pattern
class BlocController extends BlocBase {
  //DECLARANDO CONTROLADOR DO FLUXO QUE SERÁ DO TIPO INTEIRO E COMEÇARÁ DO ZERO
  final controlador = StreamController<int>();
  //DECLARANDO SAIDA DE DADODS DO TIPO INTEIRO
  Stream<int> get saida => controlador.stream;
  //DECLARANDO A ENTRADA DE DADOS DO TIPO INTEIRO
  Sink<int> get entrada => controlador.sink;
  //DECLARANDO VARIAVEL CONTADORA
  int _valor = 0;
  //DECLARANDO UM GETTER PARA RETORNAR O VALOR ATUAL DO FLUXO
  int get valor => _valor;
  //FUNÇÃO PARA AUMENTAR O NUMERO CONTADO
  aumentar() {
    entrada.add(valor);
    _valor++;
  }

//REESCREVENDO DISPOSE NO CONTORLADOR PARA FECHAR O CONTROLADOR
  @override
  void dispose() {
    super.dispose();
    controlador.close();
  }
}
