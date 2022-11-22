class SkillsModel {
  late int id;
  late String skillName;
  late String percent;

  SkillsModel();

// Take Map From DB => Convert To Model
  SkillsModel.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    skillName = rowMap['skillName'];
    percent = rowMap['percent'];
  }

  // العكس .. بدي اخزن داخل الداتابيس
// في عندي مودل و بدي احوله ل الماب
// Take Model From View => Convert To Map(rowMap)
  Map<String, dynamic> toMap() {
    Map<String, dynamic> rowMap = <String, dynamic>{};
    // rowMap['id'] = id;
    rowMap['skillName'] = skillName;
    rowMap['percent'] = percent;

    return rowMap;
  }
}
