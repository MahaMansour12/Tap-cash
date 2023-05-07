class RegisterRequest {
  RegisterRequest({
    this.name,
    this.phone,
    this.nid,
    this.age,
    this.gender,
    this.address,
    this.password,
  });

  RegisterRequest.fromJson(dynamic json) {
    name:
    json['name'];
    phone:
    json['phone'];
    nid:
    json['nid'];
    age:
    json['age'];
    gender:
    json['gender'];
    address:
    json['address'];
    password:
    json['password'];
  }

  String? name;
  String? phone;
  String? nid;
  String? age;
  String? gender;
  String? address;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['NID'] = nid;
    map['age'] = age;
    map['gender'] = gender;
    map['address'] = address;
    map['password'] = password;
    return map;
  }
}
