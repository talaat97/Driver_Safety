
import 'package:driver_safety/features/home/data/model/contact_model.dart';

class UserModel {
  String? name;
  String? phone;
  String? email;
  String? password;
  ContactModel? firstContactModel;
  ContactModel? secondContactModel;
 

  UserModel({
    required this.phone,
    required this.name,
    required this.email,
    this.password
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