class StageModel {
  final int? id;
  final String? stage;
  final String? status;
  final String? createdAt;

  StageModel({
    this.id,
    this.stage,
    this.status,
    this.createdAt,
  });

  StageModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        stage = json['stage'] as String?,
        status = json['status'] as String?,
        createdAt = json['created_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'stage' : stage,
    'status' : status,
    'created_at' : createdAt
  };
}