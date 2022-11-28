import 'package:resum_app_project/models/interests_model.dart';
import 'package:sqflite/sqflite.dart';

import '../db_settings.dart';

class InterestsDbControllers{
 final Database _myDb = DatabaseSettings().getDatabase;


 Future<int> create(InterestsModel interestsModel) async {
  // تنشئ صف جديد في الداتابيس من المودل
  var topicsName = await _myDb.rawQuery(
      'SELECT * FROM  Interests WHERE interestsName = "${interestsModel.interestsName}"');
  if (topicsName.isEmpty) {
   return await _myDb.insert("Interests", interestsModel.toMap());
  }
  return 0;
 }

 // Read All Row
 Future<List<InterestsModel>> read() async {
  // هاتلي كل الصفوف من الجدول
  var rowsMap = await _myDb.query("Interests");
  return rowsMap.map((row) => InterestsModel.fromMap(row)).toList();
 }

 // Read One Row by id
 Future<InterestsModel?> show(int id) async {
  // هاتلي صف واحد بس من خلال الid
  // idالعنصر اللي بمررلك ياه .. هاتلي ياه
  var rowMap = await _myDb.rawQuery('SELECT * FROM Interests WHERE id = "$id"');

  return rowMap.isNotEmpty ? InterestsModel.fromMap(rowMap.first) : null;
 }

 Future<bool> update(InterestsModel interestsModel) async {
  var result = await _myDb.update(
   'Interests',
   interestsModel.toMap(),
   where: 'id=?',
   whereArgs: [interestsModel.id],
  );
  return result > 0;
 }

 Future<bool> delete(int id) async {
  var result =    await _myDb.delete(
      'Interests' ,
      where: "id=?" ,
      whereArgs: [id]
  );
  return result>0;
 }

}