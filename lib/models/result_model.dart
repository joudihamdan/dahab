class ResultModel{}

class SuccessResult extends ResultModel{}
class ErrorsResult extends ResultModel{
  final String message;
  ErrorsResult(this.message);
}

class ExceptionResult extends ResultModel{
  final String message;

  ExceptionResult( {required this.message});

}
class ListOf<T>  extends ResultModel{
List<T> resutl;
ListOf({
  required this.resutl,
});
}