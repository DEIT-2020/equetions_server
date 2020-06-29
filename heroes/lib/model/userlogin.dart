import 'package:heroes/heroes.dart';

class User extends ManagedObject<_Manager> implements _Manager {}
class _Manager {

  @primaryKey
  int name;

  @Column(unique: true)
  String nickname;

  @Column(unique: true)
  String password;

}