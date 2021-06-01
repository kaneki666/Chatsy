class UserSpaceX {
  String? id;
  String? name;
  String? timestamp;

  UserSpaceX({
    required this.id,
    required this.name,
    required this.timestamp,
  });

  factory UserSpaceX.fromJson(Map<String, dynamic> json) => UserSpaceX(
        id: json['id'],
        name: json['name'],
        timestamp: json['timestamp'],
      );

  // GenericModel copy({int id, String name, String email}) =>
  // GenericModel(
  //   id:id, name:this.name, email:this.email,
  //   );

  @override
  String toString() {
    return '{${this.name}, ${this.id}, ${this.timestamp}}';
  }
}
