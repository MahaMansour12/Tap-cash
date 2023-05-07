class RegisterRespons {
  String? message;

  RegisterRespons({this.message});


  RegisterRespons.fromJson(dynamic json) {
    message:
      json['message'];

  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;

    return map;
  }

}