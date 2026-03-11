import 'package:uuid/uuid.dart';

extension UuidExtension on String {
  String get orGeneratedId {
    return this ?? const Uuid().v4();
  }
}
