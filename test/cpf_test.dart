
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto/Cpf.dart';

/*
CPF deve possuir . e -
→ verificar sem – 
→ verificar sem .
→  verificar sem as duas

CPF com máscara deve possuir 14 dígitos
A função deve retornar somente números
CPF sem máscara deve possuir 11 números
CPF não deve ter números iguais
Necessário calcular dígito
→ Quando o cálculo do 2º digito for valor maior que 10 deve retornar 0 - 743.649.600-04
→ CPF 374.579.825 deve gerar o primeiro dígito 2
→ Quando o cálculo do 2º digito for maior que 10 deve retornar 0 - 767.348.389-00
*/


void main() {
  test('CPF deve possuir . e -',(){
    var cpf = Cpf('515.169.874.85');
    expect(cpf.validarCaracteres(), false);
    cpf = Cpf('515169874-85');
    expect(cpf.validarCaracteres(), false);
    cpf = Cpf('51516987485');
    expect(cpf.validarCaracteres(), false);
    cpf = Cpf('515.169.874-85');
    expect(cpf.validarCaracteres(), true);
  });
  test('CPF com máscara deve possuir 14 dígitos',(){
    var cpf = Cpf('515.169.874.85');
    expect(cpf.validarComplimentoComMascara(), true);
  });
  test('Deve retornar somente números',(){
    var cpf = Cpf('515.169.874-85');
    expect(() => cpf.somenteNumero(),returnsNormally);
    cpf = Cpf('515.aaa.bbb-85');
    expect(() => cpf.somenteNumero(),returnsNormally);
    cpf = Cpf('515.AAA.BBB-85');
    expect(() => cpf.somenteNumero(),returnsNormally);
  });
  
  test('CPF sem máscara deve possuir 11 números',(){
    var cpf = Cpf('515.169.874-85');
    expect(cpf.validarComplimentoSemMascara(),true);
  });

  test('CPF não deve ter números iguais',(){
    var cpf = Cpf('123.456.789-11');
    expect(cpf.validarNumerosDiferentes(),true);
    cpf = Cpf('111.111.111-11');
    expect(cpf.validarNumerosDiferentes(),false);
  });

  test('quando o cálculo do 2º digito for valor maior que 10 deve retornar 0 - 743.649.600-04',(){
    var cpfSTR = '743.649.600-04';
    var cpf = Cpf(cpfSTR);
    var cpfSemDigito = cpfSTR.substring(0,11).replaceAll(RegExp(r'[\.\-\D]'),'').split(''); 
    List<int> numerosCPF = cpfSemDigito.map(int.parse).toList();
    expect(cpf.calcularDigito(10, numerosCPF),0);
  });

  test('CPF 374.579.825 deve gerar o primeiro dígito 2',(){
    var cpfSTR = '374.579.825-23';
    var cpf = Cpf(cpfSTR);
    var cpfSemDigito = cpfSTR.substring(0,11).replaceAll(RegExp(r'[\.\-\D]'),'').split(''); 
    List<int> numerosCPF = cpfSemDigito.map(int.parse).toList();
    expect(cpf.calcularDigito(10, numerosCPF),2);
  });

  test('quando o cálculo do 2º digito for valor maior que 10 deve retornar 0 - 767.348.389-00',(){
    var cpfSTR = '767.348.389-00';
    var cpf = Cpf(cpfSTR);
    var cpfSemDigito = cpfSTR.substring(0,11).replaceAll(RegExp(r'[\.\-\D]'),'').split(''); 
    List<int> numerosCPF = cpfSemDigito.map(int.parse).toList();
    expect(cpf.calcularDigito(10, numerosCPF),0);
  });
}