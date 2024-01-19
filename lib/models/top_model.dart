import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_model.g.dart';
part 'top_model.freezed.dart';

@freezed
class TopModel with _$TopModel {
  const TopModel._();
  const factory TopModel({
    required int aId,
  }) = _TopModel;

  factory TopModel.fromJson(Map<String, dynamic> json) =>
      _$TopModelFromJson(json);
  // 他のメソッド
}
