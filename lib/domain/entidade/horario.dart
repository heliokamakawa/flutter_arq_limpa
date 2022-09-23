import 'package:flutter_clean_archictere/domain/erro/hora_invalido.dart';

class Horario{
  int hora;
  int minuto;

  Horario({required this.hora,required this.minuto}){
    if(hora<0 || hora >24) throw HoraInvalido();
    if(minuto<0 || minuto > 60) throw HoraInvalido();
  }
}