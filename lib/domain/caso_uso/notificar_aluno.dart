import 'package:flutter_clean_archictere/domain/dados/dados_aluno.dart';
import 'package:flutter_clean_archictere/domain/dados/dados_email.dart';
import 'package:flutter_clean_archictere/domain/portas/enviar_email.dart';

class NotificarAluno{
  DadosAluno dadosAluno;
  late EnviarEmail email;

  NotificarAluno(this.dadosAluno){
    //conversão de dados
  }

  enviarEmail(){
    var dadosEmail = DadosEmail(dadosAluno.email);
    email.enviar(dadosEmail);
  }
}