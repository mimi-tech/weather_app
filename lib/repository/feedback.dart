class Success{
  String? message;
  Map<String, dynamic>? data;
  Success({ this.data,this.message});
}

class Failure{
  String? errorResponse;
  Failure({ this.errorResponse});

}