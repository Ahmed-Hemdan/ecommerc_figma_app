class UserModel {
  String? name;
  String? email;
  String? id;
  String? photoUrl;
  UserModel({this.name, this.email, this.id , this.photoUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      email: json['email'],
      id: json["id"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
    };
  }
}
