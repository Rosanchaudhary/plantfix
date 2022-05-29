
class ResError{
  String error;

  ResError(this.error);
  factory ResError.fromJson(dynamic json) {
    return ResError(
      json['error'],
        );
  }
  @override
  String toString() {
    return '{${this.error} }';
  }
}

// {
//     "response": "Registration Successful!",
//     "username": "Nabina",
//     "email": "nabina@gmail.com",
//     "token": {
//         "refresh": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0NDczOTc5OSwiaWF0IjoxNjQ0NjUzMzk5LCJqdGkiOiIzZDRjNzBkNzE1MTY0ZGE2YjhkMjZhNjlhOWNkY2JmOSIsInVzZXJfaWQiOjJ9.vDjVjucFaTpDxNgd0I7keA_w6hfN0ecXT47-ccbUOrU",
//         "access": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQ0NjUzNjk5LCJpYXQiOjE2NDQ2NTMzOTksImp0aSI6IjJiYzkwZjdhZTBiZTQ5YjNhYzRlYjA0MzcyYWNlYzhiIiwidXNlcl9pZCI6Mn0.G8GAiuN6bd-qBRKihFZLVoXu-hgV6R6QlRMewVEVxgo"
//     }
// }