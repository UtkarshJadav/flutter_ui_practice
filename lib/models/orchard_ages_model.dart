class OrchadAges {
  final int? id;
  final String? age;
  final String? status;
  final dynamic createdAt;

  OrchadAges({
    this.id,
    this.age,
    this.status,
    this.createdAt,
  });

  OrchadAges.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        age = json['age'] as String?,
        status = json['status'] as String?,
        createdAt = json['created_at'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'age' : age,
    'status' : status,
    'created_at' : createdAt
  };
}