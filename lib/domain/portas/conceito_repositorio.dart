import 'package:flutter_clean_archictere/domain/dados/conceito.dart';
import 'package:flutter_clean_archictere/domain/dados/dados_aluno.dart';

abstract class ConceitoRepositorio{
  identificarAluno(DadosAluno dadosAluno);
  bool salvar(Conceito conceito);
}