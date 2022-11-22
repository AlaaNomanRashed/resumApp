import 'package:resum_app_project/models/skills_model.dart';
import 'package:sqflite/sqflite.dart';

import '../db_settings.dart';

class SkillsDbController {
  final Database _myDb = DatabaseSettings().getDatabase;

  Future<int> create(SkillsModel skillsModel) async {
    // تنشئ صف جديد في الداتابيس من المودل
    var topicsName = await _myDb.rawQuery(
        'SELECT * FROM OneSkill WHERE skillName = "${skillsModel.skillName}"');
    if (topicsName.isEmpty) {
      return await _myDb.insert("OneSkill", skillsModel.toMap());
    }
    return 0;
  }

  // Read All Row
  Future<List<SkillsModel>> read() async {
    // هاتلي كل الصفوف من الجدول
    var rowsMap = await _myDb.query("OneSkill");
    return rowsMap.map((row) => SkillsModel.fromMap(row)).toList();
  }

  // Read One Row by id
  Future<SkillsModel?> show(int id) async {
    // هاتلي صف واحد بس من خلال الid
    // idالعنصر اللي بمررلك ياه .. هاتلي ياه
    var rowMap = await _myDb.rawQuery('SELECT * FROM OneSkill WHERE id = "$id"');

    return rowMap.isNotEmpty ? SkillsModel.fromMap(rowMap.first) : null;
  }

  Future<bool> update(SkillsModel skillsModel) async {
    var result = await _myDb.update(
      'Skills',
      skillsModel.toMap(),
      where: 'id=?',
      whereArgs: [skillsModel.id],
    );
    return result > 0;
  }

  Future<bool> delete(int id) async {
    var result = await _myDb.delete('OneSkill', where: "id=?", whereArgs: [id]);
    return result > 0;
  }
}
