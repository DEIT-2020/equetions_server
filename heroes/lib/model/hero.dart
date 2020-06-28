import 'package:heroes/heroes.dart';

class Hero extends ManagedObject<_Hero> implements _Hero {}


class _Hero { 
  @primaryKey
  int id;

  @Column(unique: true)
  String name;
}


class Login extends ManagedObject<login> implements login {}
class login {//用户表
  @primaryKey
  int loginid;
  @Column(unique: true)
  String name;//用户账号

  @Column(unique: true)
  String password;//用户密码
}

class Practice extends ManagedObject<practice> implements practice {}

class  practice{ //个人中心的练习记录
@primaryKey
int pid;
  @Column(unique: true)
  String name;//用户名

  @Column(unique: true)
  String ptime;//用时

  @Column(unique: true)
  String type;//类型

  @Column(unique: true)
  String rapid;//速度
  
  @Column(unique: true)
  String pnumber;//总计题数

}
class Questions extends ManagedObject<q_a> implements q_a {
  
}
class  q_a{ //题库
  @primaryKey
  int tid;//题目编号

  @Column(unique: true)
  String question;//题目

  @Column(unique: true)
  String type;//类型

  @Column(unique: true)
  String answer;//答案
  
}
//1+1



class  game{ //个人中心的闯关记录
  @primaryKey
  int gameid;
  @Column(unique:true )
  String name;//用户名

  @Column(unique: true)
  String gtime;//用时

  @Column(unique: true)
  String gnumber;//闯关次数

  @Column(unique: true)
  String tnumber;//题数
  

}