import 'package:flutter_clean_archictere/domain/dados/conceito.dart';
import 'package:flutter_clean_archictere/domain/entidade/horario.dart';
import 'package:flutter_clean_archictere/domain/erro/hora_invalido.dart';

class Pontualidade{
  Horario entrada; 
  Horario saida;
  final _horarioEntrada = DateTime(0,0,0,19,20);
  final _horarioSaida = DateTime(0,0,0,22,50);

  Pontualidade({required this.entrada,required this.saida}){
    if(entrada.hora == 7) throw HoraInvalido();
    if(saida.hora == 10) throw HoraInvalido();
  }
  
  Duration atraso(){
    var zero = const Duration(minutes: 0);
    DateTime entradaAuno = DateTime(0,0,0,entrada.hora,entrada.minuto);
    var atraso = entradaAuno.difference(_horarioEntrada);
    if(atraso < zero) return zero;
    return atraso;
  }

  Duration saidaAntecipada(){
    var zero = const Duration(minutes: 0);
    DateTime saidaAluno = DateTime(0,0,0,saida.hora,saida.minuto);
    var saidaAntecipada = _horarioSaida.difference(saidaAluno);
    if(saidaAntecipada < zero) return zero;
    return saidaAntecipada;
  }

  Duration perdaTotalMinutos(){
    var perdaTotal = atraso() + saidaAntecipada();
    return perdaTotal;
  }

  Conceito definirConceito(){
    var perdaTotal = perdaTotalMinutos();
    if(perdaTotal == const Duration(minutes: 0)) return Conceito.A;
    else if(perdaTotal < const Duration(minutes: 11)) return Conceito.B;
    else if(perdaTotal < const Duration(minutes: 16)) return Conceito.C;
    else return Conceito.D;
  }
}