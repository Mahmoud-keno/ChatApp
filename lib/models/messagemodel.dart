class Messagemodel {
 final String message;

  Messagemodel({required this.message});

factory Messagemodel.fromJson(jsondata){
  return Messagemodel(message: jsondata['Text']);
}
}

