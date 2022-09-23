

import 'package:flutter_clean_archictere/domain/dados/conceito.dart';
import 'package:flutter_clean_archictere/domain/entidade/horario.dart';
import 'package:flutter_clean_archictere/domain/entidade/pontualidade.dart';
import 'package:flutter_clean_archictere/domain/erro/erro_dominio.dart';
import 'package:flutter_test/flutter_test.dart';

main(){
  Pontualidade pontualidade;

  var saida = Horario(hora: 22, minuto: 50);

  group('pontualidade', (){
    test('hora com 7 deve gerar erro', (){
       expect(()=> Pontualidade(
        entrada: Horario(hora: 7, minuto: 20), 
        saida: Horario(hora: 22, minuto: 20))
       , throwsException);
    });
    test('hora com 10 deve gerar erro', (){
       expect(()=> Pontualidade(
        entrada: Horario(hora: 19, minuto: 20), 
        saida: Horario(hora: 10, minuto: 50))
       , throwsException);
    });
    test('hora errada deve gerar um erro de domínio', (){
      expect(()=>Pontualidade(
        entrada: Horario(hora: 19, minuto: 20), 
        saida: Horario(hora: 10, minuto: 50))
       , throwsA(const TypeMatcher<ErroDominio>()));
    });
    test('horário correto deve retornar 0', (){
      pontualidade = Pontualidade(
        entrada: Horario(hora: 19, minuto: 20), 
        saida: saida
      );
      expect(pontualidade.atraso(), const Duration(minutes: 0));
    });
    test('atraso de 10 minutos', (){
      pontualidade = Pontualidade(
        entrada: Horario(hora: 19, minuto: 30), 
        saida: saida
      );
      expect(pontualidade.atraso(), const Duration(minutes: 10));
    });
    test('saída correta deve retornar 0', (){
      pontualidade = Pontualidade(
        entrada: Horario(hora: 19, minuto: 30), 
        saida: Horario(hora: 22, minuto: 50)
      );
      expect(pontualidade.saidaAntecipada(), const Duration(minutes: 0));
    });
    test('saída antecipada de 10 minutos', (){
      pontualidade = Pontualidade(
        entrada: Horario(hora: 19, minuto: 30), 
        saida: Horario(hora: 22, minuto: 40)
      );
      expect(pontualidade.saidaAntecipada(), const Duration(minutes: 10));
    });
    test('calculo total de perda de aula 10 entrada e 10 saída', (){
      pontualidade = Pontualidade(
        entrada: Horario(hora: 19, minuto: 30), 
        saida: Horario(hora: 22, minuto: 40)
      );
      expect(pontualidade.perdaTotalMinutos(), const Duration(minutes: 20));
    });
    test('entrada antecipada de 10 saída antecipada de 10 deve gerar 10 de perda', (){
      pontualidade = Pontualidade(
        entrada: Horario(hora: 19, minuto: 10), 
        saida: Horario(hora: 22, minuto: 40)
      );
      expect(pontualidade.perdaTotalMinutos(), const Duration(minutes: 10));
    });
    test('saida tardia de 10 e atraso de 10 deve gerar 10 de perda', (){
      pontualidade = Pontualidade(
        entrada: Horario(hora: 19, minuto: 30), 
        saida: Horario(hora: 23, minuto: 00)
      );
      expect(pontualidade.perdaTotalMinutos(), const Duration(minutes: 10));
    });
    test('sem atraso deve gerar o conceito A', (){
      pontualidade = Pontualidade(
        entrada: Horario(hora: 19, minuto: 20), 
        saida: Horario(hora: 22, minuto: 50)
      );
      expect(pontualidade.definirConceito(), Conceito.A);
    });
    test('atraso 10 saída antecipada 0 deve gerar o conceito B', (){
      pontualidade = Pontualidade(
        entrada: Horario(hora: 19, minuto: 30), 
        saida: Horario(hora: 22, minuto: 50)
      );
      expect(pontualidade.definirConceito(), Conceito.B);
    });
    test('atraso 0 saída antecipada 10 deve gerar o conceito B', (){
      pontualidade = Pontualidade(
        entrada: Horario(hora: 19, minuto: 20), 
        saida: Horario(hora: 22, minuto: 40)
      );
      expect(pontualidade.definirConceito(), Conceito.B);
    });
    test('atraso 5 saída antecipada 10 deve gerar o conceito C', (){
      pontualidade = Pontualidade(
        entrada: Horario(hora: 19, minuto: 25), 
        saida: Horario(hora: 22, minuto: 40)
      );
      expect(pontualidade.definirConceito(), Conceito.C);
    });
  });
}