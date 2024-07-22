import 'package:freezed_annotation/freezed_annotation.dart';

part 'procedure.freezed.dart';

part 'procedure.g.dart';

@freezed
class Procedure with _$Procudure {
  const factory Procedure({
    required String title,
    required String content,
  }) = Procedure;
  
  factory Procedure.fromJson(Map<String, Object?> json) => _$ProcedureFromJson(json);
}