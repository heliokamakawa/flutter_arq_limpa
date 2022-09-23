
import 'package:flutter_clean_archictere/domain/dados/dados_email.dart';

abstract class EnviarEmail{
  bool enviar(DadosEmail email);
}