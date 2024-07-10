import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String imageUrl,
    required String name,
    required String locationName,

  }) = _Profile;

  factory Profile.fromJson(Map<String, Object?> json) => _$ProfileFromJson(json);
}