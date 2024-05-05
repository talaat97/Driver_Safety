class ContactModel
{
  String? name;
  String? phone;
  String? msgTo;

   ContactModel({
    required this.phone,
    required this.name,
    this.msgTo
  });

  ContactModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    msgTo = json['msgTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['name'] = name;
    data['msgTo'] = msgTo;
    return data;
  }
}