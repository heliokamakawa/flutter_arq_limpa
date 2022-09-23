import 'package:flutter_clean_archictere/domain/dados/conceito.dart';

class Projeto{
  Conceito fundamento; 
  Conceito compreensao; 
  Conceito complexidade; 
  Conceito originalidade; 

  Projeto({required this.fundamento,required this.compreensao, required this.complexidade, required this.originalidade});

  Conceito definirConceito(){
    Conceito conceitoProjeto = fundamento;
    if(compreensao.valor < conceitoProjeto.valor) conceitoProjeto = compreensao;
    if(complexidade.valor < conceitoProjeto.valor) conceitoProjeto = complexidade; 
    if(originalidade.valor < conceitoProjeto.valor) conceitoProjeto = originalidade;
    return conceitoProjeto;
  }
}