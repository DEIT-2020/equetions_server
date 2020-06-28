import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/hero.dart';
class InputCon extends ResourceController{
    final ManagedContext context; 
    InputCon(this.context);
    @Operation.post()
    Future<Response> insert_data(@Bind.body() Questions ques) async {
    var rs=await context.insertObject<Questions>(ques);
    return Response.ok(rs);
  }

}