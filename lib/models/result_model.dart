class ResultModel{}

class SuccessResult extends ResultModel{}
class EmptyResult extends ResultModel{
  final String message;
  EmptyResult(this.message);
}
class ErrorsResult extends ResultModel{
  final String message;
  ErrorsResult(this.message);
}

class ExceptionResult extends ResultModel{
  final String message;

  ExceptionResult( {required this.message});
}

class ListOf<T extends ResultModel>  extends ResultModel{
List<T> resutl ;
ListOf({
  required this.resutl,
});
}

class ListSt<T>  extends ResultModel{
List<T> resutl ;
ListSt({
  required this.resutl,
});
}