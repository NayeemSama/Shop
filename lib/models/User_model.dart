class UserModel{
  int? id;
  String name;
  int age;
  String country;
  String? email;

  UserModel({ this.id, required this.name, required this.age, required this.country, this.email});

  UserModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        age = res["age"],
        country = res["country"],
        email = res["email"];

  Map<String, Object?> toMap() {
    return {'id':id,'name': name, 'age': age, 'country': country, 'email': email};
  }

}