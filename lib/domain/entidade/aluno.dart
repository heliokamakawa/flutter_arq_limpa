import 'package:flutter_clean_archictere/domain/dados/dados_aluno.dart';
import 'package:flutter_clean_archictere/domain/erro/email_invalido.dart';
import 'package:flutter_clean_archictere/domain/erro/nome_invalido.dart';


class Aluno{
  late String nome; 
  late String email;

  Aluno({required this.nome,required this.email});

  Aluno.criar(DadosAluno dadosParticipante){
    var nome = dadosParticipante.nome;
    var email = dadosParticipante.email;
    if (nome.isEmpty || nome.length < 3) throw NomeInvalido();
    if (email.isEmpty || !email.contains('@')) throw EmailInvalido();
    this.nome = nome;
    this.email = email;
  }
}