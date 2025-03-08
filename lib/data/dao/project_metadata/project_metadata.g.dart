// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_metadata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectMetadataAdapter extends TypeAdapter<ProjectMetadata> {
  @override
  final int typeId = 0;

  @override
  ProjectMetadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProjectMetadata(
      key: fields[0] as String,
      englishTitle: fields[1] as String,
      kannadaTitle: fields[2] as String,
      category: fields[3] as String,
      subTitle: fields[4] as String?,
      icon: fields[5] as String,
      thumbnailImage: fields[6] as String,
      isFeatured: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ProjectMetadata obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.englishTitle)
      ..writeByte(2)
      ..write(obj.kannadaTitle)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.subTitle)
      ..writeByte(5)
      ..write(obj.icon)
      ..writeByte(6)
      ..write(obj.thumbnailImage)
      ..writeByte(7)
      ..write(obj.isFeatured);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectMetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
