import 'heroes.dart';
import 'controller/heroes_controller.dart';
import 'controller/InputCon.dart';
/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class HeroesChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
 ManagedContext context;
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    final config = HeroConfig(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
     final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName);


    context = ManagedContext(dataModel, persistentStore);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();
    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/


    router//首页
      .route("/index")
      .linkFunction((request) async {
        return Response.ok("Hello world");
      });
      router.route("/static/*").link(()=>FileController("static/static"));

      router.route("/input").link(()=>InputCon(context));
    router//普通计算器
      .route('/calculator')
      .link(() => HeroesController(context));
    router//练习模式
      .route('/practice')
      .link(() => HeroesController(context));
    router//首页
      .route('/homePage')
      .link(() => HeroesController(context));
    router//个人中心
      .route('/self')
      .link(() => HeroesController(context));
    return router;
  }
}

class HeroConfig extends Configuration {
  HeroConfig(String path): super.fromFile(File(path));

  DatabaseConfiguration database;
}