import '../../domain/entities/source.dart';

class SourceModel extends Source {
  const SourceModel({
    required String id,
    String? name,
  }) : super(
          id: id,
          name: name ?? '',
        );

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'] ?? '-',
      name: json['name'] ?? '-',
    );
  }
}
