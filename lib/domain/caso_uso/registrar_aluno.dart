import 'package:flutter_clean_archictere/domain/caso_uso/notificar_aluno.dart';
import 'package:flutter_clean_archictere/domain/dados/dados_aluno.dart';
import 'package:flutter_clean_archictere/domain/entidade/aluno.dart';
import 'package:flutter_clean_archictere/domain/portas/aluno_repositorio.dart';
import 'package:flutter_clean_archictere/domain/portas/enviar_email.dart';

class RegistrarAluno{
  DadosAluno dadosAluno;
  late Aluno aluno;
  late AlunoRepositorio repositorio;
  late EnviarEmail email;

  RegistrarAluno(this.dadosAluno){
    aluno = Aluno.criar(dadosAluno);
    var notificar = NotificarAluno(dadosAluno);
    if(repositorio.salvar(dadosAluno)) notificar.enviarEmail();
  }
}