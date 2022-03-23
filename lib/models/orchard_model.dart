class OrchardModel {
  final int? id;
  final String? name;
  final String? densityType;
  final dynamic orchardId;
  final String? location;
  final dynamic establishmentDate;
  final dynamic totalPlant;
  final dynamic size;
  final int? lat;
  final int? lng;
  final int? ownerId;
  final int? ageId;
  final int? stageId;
  final dynamic statusId;
  final int? yieldId;
  final OrchardYield? orchardYield;
  final Age? age;
  final Stage? stage;
  final String? status;
  final String? createdAt;
  final LastUpdate? lastUpdate;

  OrchardModel({
    this.id,
    this.name,
    this.densityType,
    this.orchardId,
    this.location,
    this.establishmentDate,
    this.totalPlant,
    this.size,
    this.lat,
    this.lng,
    this.ownerId,
    this.ageId,
    this.stageId,
    this.statusId,
    this.yieldId,
    this.orchardYield,
    this.age,
    this.stage,
    this.status,
    this.createdAt,
    this.lastUpdate,
  });

  OrchardModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        densityType = json['density_type'] as String?,
        orchardId = json['orchard_id'],
        location = json['location'] as String?,
        establishmentDate = json['establishment_date'],
        totalPlant = json['total_plant'],
        size = json['size'],
        lat = json['lat'] as int?,
        lng = json['lng'] as int?,
        ownerId = json['owner_id'] as int?,
        ageId = json['age_id'] as int?,
        stageId = json['stage_id'] as int?,
        statusId = json['status_id'],
        yieldId = json['yield_id'] as int?,
        orchardYield = (json['orchard_yield'] as Map<String,dynamic>?) != null ? OrchardYield.fromJson(json['orchard_yield'] as Map<String,dynamic>) : null,
        age = (json['age'] as Map<String,dynamic>?) != null ? Age.fromJson(json['age'] as Map<String,dynamic>) : null,
        stage = (json['stage'] as Map<String,dynamic>?) != null ? Stage.fromJson(json['stage'] as Map<String,dynamic>) : null,
        status = json['status'] as String?,
        createdAt = json['created_at'] as String?,
        lastUpdate = (json['last_update'] as Map<String,dynamic>?) != null ? LastUpdate.fromJson(json['last_update'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'density_type' : densityType,
    'orchard_id' : orchardId,
    'location' : location,
    'establishment_date' : establishmentDate,
    'total_plant' : totalPlant,
    'size' : size,
    'lat' : lat,
    'lng' : lng,
    'owner_id' : ownerId,
    'age_id' : ageId,
    'stage_id' : stageId,
    'status_id' : statusId,
    'yield_id' : yieldId,
    'orchard_yield' : orchardYield?.toJson(),
    'age' : age?.toJson(),
    'stage' : stage?.toJson(),
    'status' : status,
    'created_at' : createdAt,
    'last_update' : lastUpdate?.toJson()
  };
}

class OrchardYield {
  final int? id;
  final String? yield;

  OrchardYield({
    this.id,
    this.yield,
  });

  OrchardYield.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        yield = json['yield'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'yield' : yield
  };
}

class Age {
  final int? id;
  final String? age;

  Age({
    this.id,
    this.age,
  });

  Age.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        age = json['age'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'age' : age
  };
}

class Stage {
  final int? id;
  final String? stage;

  Stage({
    this.id,
    this.stage,
  });

  Stage.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        stage = json['stage'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'stage' : stage
  };
}

class LastUpdate {
  final int? id;
  final int? ownerId;
  final String? name;
  final String? establishmentDate;
  final int? totalPlant;
  final String? size;
  final String? location;
  final int? lng;
  final int? lat;
  final int? updatedById;
  final String? updatedBy;
  final int? orchardId;
  final int? ageId;
  final int? stageId;
  final dynamic statusId;
  final int? yieldId;
  final String? densityType;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final Stage? stage;
  final Age? age;
  final OrchardYield? orchardYield;

  LastUpdate({
    this.id,
    this.ownerId,
    this.name,
    this.establishmentDate,
    this.totalPlant,
    this.size,
    this.location,
    this.lng,
    this.lat,
    this.updatedById,
    this.updatedBy,
    this.orchardId,
    this.ageId,
    this.stageId,
    this.statusId,
    this.yieldId,
    this.densityType,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.stage,
    this.age,
    this.orchardYield,
  });

  LastUpdate.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        ownerId = json['owner_id'] as int?,
        name = json['name'] as String?,
        establishmentDate = json['establishment_date'] as String?,
        totalPlant = json['total_plant'] as int?,
        size = json['size'] as String?,
        location = json['location'] as String?,
        lng = json['lng'] as int?,
        lat = json['lat'] as int?,
        updatedById = json['updated_by_id'] as int?,
        updatedBy = json['updated_by'] as String?,
        orchardId = json['orchard_id'] as int?,
        ageId = json['age_id'] as int?,
        stageId = json['stage_id'] as int?,
        statusId = json['status_id'],
        yieldId = json['yield_id'] as int?,
        densityType = json['density_type'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        deletedAt = json['deleted_at'],
        stage = (json['stage'] as Map<String,dynamic>?) != null ? Stage.fromJson(json['stage'] as Map<String,dynamic>) : null,
        age = (json['age'] as Map<String,dynamic>?) != null ? Age.fromJson(json['age'] as Map<String,dynamic>) : null,
        orchardYield = (json['orchard_yield'] as Map<String,dynamic>?) != null ? OrchardYield.fromJson(json['orchard_yield'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'owner_id' : ownerId,
    'name' : name,
    'establishment_date' : establishmentDate,
    'total_plant' : totalPlant,
    'size' : size,
    'location' : location,
    'lng' : lng,
    'lat' : lat,
    'updated_by_id' : updatedById,
    'updated_by' : updatedBy,
    'orchard_id' : orchardId,
    'age_id' : ageId,
    'stage_id' : stageId,
    'status_id' : statusId,
    'yield_id' : yieldId,
    'density_type' : densityType,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'deleted_at' : deletedAt,
    'stage' : stage?.toJson(),
    'age' : age?.toJson(),
    'orchard_yield' : orchardYield?.toJson()
  };
}
