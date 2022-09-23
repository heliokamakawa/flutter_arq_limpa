class Cpf {
  String cpf;
  final String mensagemCPFInvalido = 'CPF inválido.';
  final String mensagemComplimentoComMascara = 'CPF com máscara deve possuir 14 dígitos.';

  Cpf(this.cpf){
    //if(!validarCPF()) throw Exception('CPF inválido');
  }

  bool validarCPF(){
    return 
      validarCaracteres()
      && validarComplimentoComMascara();
  }

  bool validarCaracteres(){
    return cpf.contains('.') && cpf.contains('-');
  }

  bool validarComplimentoComMascara(){
    return cpf.length == 14;
  }

  String somenteNumero(){
    var somenteNumero = cpf.replaceAll(RegExp(r'[\.\-\D]'),'');
    return somenteNumero;
  }
  
  bool validarComplimentoSemMascara(){
    return somenteNumero().toString().length == 11;
  }

  bool validarNumerosDiferentes(){
    var valido = false;
    var numeroCPF = somenteNumero().split('');
    numeroCPF.forEach((caractere){
      if(caractere != numeroCPF[0]) valido = true;
    });
    return valido;
  }

  int calcularDigito(int peso, List<int> numerosCPF) {
    var soma = 0;
    numerosCPF.forEach((numero) { 
      soma += numero * peso;
      peso --;
    });
    var digito =  11 - (soma % 11);
    return digito > 9 ? 0 : digito;
	}

  bool validarDigito(){
    var cpfSemDigito = cpf.substring(0,11).replaceAll(RegExp(r'[\.\-\D]'),'').split(''); 
    List<int> numerosCPF = cpfSemDigito.map(int.parse).toList();
    var primeiroDigito = calcularDigito(10, numerosCPF);
    numerosCPF.add(primeiroDigito);
    var segundoDigito = calcularDigito(11, numerosCPF);
    numerosCPF.add(segundoDigito);
    var cpfCalculado = numerosCPF.map((i) => i.toString()).join('');
    return cpfCalculado == somenteNumero();
  }
}
