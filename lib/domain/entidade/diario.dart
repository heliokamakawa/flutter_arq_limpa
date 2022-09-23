import 'package:flutter_clean_archictere/domain/entidade/aluno.dart';
import 'package:flutter_clean_archictere/domain/entidade/pontualidade.dart';
import 'package:flutter_clean_archictere/domain/entidade/projeto.dart';

import '../dados/conceito.dart';

class Diario{
  Aluno aluno;
  Pontualidade pontualidade;
  Projeto projeto;
  DateTime data;

  Diario({required this.aluno, required this.pontualidade, required this.projeto, required this.data});

  Conceito definirConceito(){
    Conceito conceitoProjeto = projeto.definirConceito();
    Conceito conceitoPontualidade = pontualidade.definirConceito();
    return 
      (conceitoProjeto.valor < conceitoPontualidade.valor) ?
        conceitoProjeto : conceitoPontualidade;
  }
}