import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String code;
  final String message;
  

  CustomError({this.code = '', this.message = ''});

  @override
  List<Object> get props {
    return [code, message];
  }
 
  @override
  String toString() {
    return  'CustomError(code: $code,message: $message)';
  }
}
