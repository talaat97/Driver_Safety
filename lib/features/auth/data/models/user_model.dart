
class UserModel {
  String? name;
  String? phone;
  String? email;
  String? password;
 

  UserModel({
    required this.phone,
    required this.name,
    required this.email,
    required this.password
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}