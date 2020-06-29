import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/hero.dart';

class UserController extends ResourceController {
   UserController(this.context);

  final ManagedContext context;

@Operation.get('username')
Future<Response> getAllHeroes({@Bind.query('username') String username}) async {
  final heroQuery = Query<Hero>(context);
  if (username != null) {
    heroQuery.where((user) => user.name).contains(username, caseSensitive: false);
  }
  final heroes = await heroQuery.fetch();
     if (heroes != null)
     { return Response.ok("ok");}

   if (heroes == null) {
      return Response.notFound();
     }


  @Operation.get()
  Future<Response> getAllHeroes() async {
 
    final heroQuery = Query<Hero>(context);
    final heroes = await heroQuery.fetch();
   if (username == null) {
      return Response.notFound();
    return Response.ok(heroes);
  }

  @Operation.post('login')
  Future<Response> getHeroByID(@Bind.path('username') String username) async {
      print(username);
    final heroQuery = Query<Hero>(context)..where((user) => user.name).equalTo(username);
    final hero = await heroQuery.fetchOne();//fetchone从数据库中获取int类型的变量

    if (hero == null) {
      return Response.notFound();
    }
    
    return Response.ok("");
  }
  @Operation.post('login')
  Future<Response> login(@Bind.path('username') String username) async {
      print(username);
    return Response.ok("");
  }
}
}}