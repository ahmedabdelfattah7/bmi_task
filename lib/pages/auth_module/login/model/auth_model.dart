class UserModel {
   String? name;
   String? email;
   String? uid;
   String? createdAt;

  UserModel({
     this.name,
     this.email,
     this.uid,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    return UserModel(
      name: json!['name'],
      email: json['email'],
      uid: json['uid'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'created_at': createdAt,
    };
  }
}