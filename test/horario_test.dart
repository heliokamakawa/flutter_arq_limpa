

import 'package:flutter_clean_archictere/domain/entidade/horario.dart';
import 'package:flutter_clean_archictere/domain/erro/erro_dominio.dart';
import 'package:flutter_test/flutter_test.dart';

main(){

  group('hora e minuto não pode ser negativo', (){
    test('hora não pode ser negativo', (){
      expect(()=>Horario(hora: -5, minuto: 20), throwsException);
    });
    test('hora não pode ser maior que 24', (){
      expect(()=>Horario(hora: 25, minuto: 20), throwsException);
    });
    test('minuto não pode ser negativo', (){
      expect(()=>Horario(hora: 5, minuto: -20), throwsException);
    });
    test('minuto não pode exceder 60', (){
      expect(()=>Horario(hora: 5, minuto: 61), throwsException);
    });
    test('hora errada deve gerar um erro de domínio', (){
      expect(()=>Horario(hora: -5, minuto: 20), throwsA(const TypeMatcher<ErroDominio>()));
    });
    test('minuto errado gerar um erro de domínio', (){
      expect(()=>Horario(hora: 5, minuto: -20), throwsA(const TypeMatcher<ErroDominio>()));
    });
  });
}