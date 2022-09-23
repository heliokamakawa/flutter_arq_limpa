import 'package:flutter_clean_archictere/domain/dados/conceito.dart';
import 'package:flutter_clean_archictere/domain/dados/dados_aluno.dart';
import 'package:flutter_clean_archictere/domain/entidade/aluno.dart';
import 'package:flutter_clean_archictere/domain/entidade/diario.dart';
import 'package:flutter_clean_archictere/domain/entidade/horario.dart';
import 'package:flutter_clean_archictere/domain/entidade/pontualidade.dart';
import 'package:flutter_clean_archictere/domain/entidade/projeto.dart';
import 'package:flutter_clean_archictere/domain/erro/aluno_inexistente.dart';
import 'package:flutter_clean_archictere/domain/portas/aluno_repositorio.dart';
import 'package:flutter_clean_archictere/domain/portas/conceito_repositorio.dart';

class RegistrarConceito{
  AlunoRepositorio repositorioAluno;
  ConceitoRepositorio repositorioConceito;
  DadosAluno dadosAluno;
  Projeto projeto;
  Horario entrada;
  Horario saida;
  late Diario diario;
  late Aluno aluno;

  RegistrarConceito(this.repositorioAluno, this.repositorioConceito,this.dadosAluno, this.entrada,this.saida,this.projeto){
    if(!repositorioAluno.existe(dadosAluno)) throw AlunoInexistente();
    Aluno aluno = Aluno.criar(dadosAluno);
    var pontualidade = Pontualidade(entrada: entrada, saida: saida);
    diario = Diario(aluno: aluno,pontualidade: pontualidade,projeto: projeto, data: DateTime.now());
    repositorioConceito.identificarAluno(dadosAluno);
    if(repositorioConceito.salvar(diario.definirConceito())) notificarAluno();
  }

  notificarAluno(){
    print(aluno.email);
  }
}