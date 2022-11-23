import 'package:resum_app_project/database/db_settings.dart';
import 'package:sqflite/sqlite_api.dart';

import '../../models/experience_model.dart';

class ExperienceDbController {
final Database _myDb = DatabaseSettings().getDatabase;

Future<int> create(ExperienceModel experienceModel)async{
var result =   await _myDb.rawQuery('SELECT * FROM Experience WHERE name = "${experienceModel.name}"');
if(result.isEmpty){
  return await _myDb.insert('Experience', experienceModel.toMap());
}
return 0;
}
Future<List<ExperienceModel>> read()async{
 var rowsMap =  await _myDb.query('Experience');
 return rowsMap.map((row) => ExperienceModel.fromMap(row)).toList();

}
Future<ExperienceModel?> show(int id)async{
var rowMap =   await _myDb.rawQuery('SELECT * FROM Experience WHERE id = "$id" ');
  return rowMap.isNotEmpty ? ExperienceModel.fromMap(rowMap.first) : null;
}
Future<bool> update(ExperienceModel experienceModel)async{
 var result =  await _myDb.update('Experience', experienceModel.toMap(), where: "id = ?" , whereArgs: [experienceModel.id] );
 return result>0;
}
Future<bool> delete(int id)async{
var result =  await _myDb.delete('Experience' , where: 'id = ? ' , whereArgs: [id]);
return result>0;
}
}