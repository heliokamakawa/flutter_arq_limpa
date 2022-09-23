class ErroDominio implements Exception {
  String causa; 

  ErroDominio(this.causa);

  @override 
  String toString(){
    return causa;
  }

}