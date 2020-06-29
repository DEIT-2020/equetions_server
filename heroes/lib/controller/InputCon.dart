import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/hero.dart';
class InputCon extends ResourceController{
    final ManagedContext context; 
    InputCon(this.context);
    /*
    Future<Response> createQuestion(
      @Bind.body(ignore: ["questionId"]) Question inputQuestion) async {
    final query = Query<Question>(context)..values = inputQuestion;

    final insertedQuestion = await query.insert();

    return Response.ok(insertedQuestion);
    
    */
    @Operation.post()
  Future<Response> insert_data(@Bind.body(ignore: ['tid'])Questions questions) async {
    var query=Query<Questions>(context)..values=questions;
    var rs=await query.insert();
    return Response.ok(rs);
  }
 /* @Operation.get()
 Future<Response> get_data() async {
    var query=Query<Questions>(context);
    List<Questions> rs=await query.fetch();
    return Response.ok({"rs":rs,"size":rs.length});
  }
 */

  @Operation.get()
  Future<Response> get_data() async {
    final query=Query<Questions>(context);
    final rs = await query.fetch();
    return Response.ok(rs);
  }
}