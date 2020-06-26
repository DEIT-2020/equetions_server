import 'package:heroes/heroes.dart';

class Hero extends ManagedObject<_Hero> implements _Hero {}

class _Hero {
  @primaryKey
  int id;

  @Column(unique: true)
  String name;
}

class _user {//用户表
  @primaryKey
  int useraccout;//用户账号

  @Column(unique: true)
  String userpassword;//用户密码
}

class _userrecord{//用户、记录对应表
  @primaryKey
  int useraccount;//用户账号

  @Column(unique: true)
  String recordid;
}

class  _record{ //一次闯关记录
  @primaryKey
  int recordid;//记录编号

  @Column(unique: true)
  String length;//用时

  @Column(unique: true)
  String accuracy;//正确率
  
  @Column(unique: true)
  String stoppingmode;//本次闯关结束的模式

}
