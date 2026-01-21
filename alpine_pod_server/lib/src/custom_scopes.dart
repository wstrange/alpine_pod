import 'package:serverpod/serverpod.dart';

class CustomScope extends Scope {
  const CustomScope(String super.name);

  static const admin = CustomScope('admin');
  static const sectionManager = CustomScope('sectionManager');
  static const eventManager = CustomScope('eventManager');
  static const member = CustomScope('member');
}
