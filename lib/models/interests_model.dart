//' subject TEXT '

class InterestsModel{
  late int id;
  late String interestsName;


  InterestsModel();

// Take Map From DB => Convert To Model
  InterestsModel.fromMap(Map<String , dynamic> rowMap) {
    id = rowMap['id'];
    interestsName = rowMap['interestsName'];
  }

  // العكس .. بدي اخزن داخل الداتابيس
// في عندي مودل و بدي احوله ل الماب
// Take Model From View => Convert To Map(rowMap)
  Map<String , dynamic> toMap(){
    Map<String , dynamic> rowMap = <String , dynamic>{};
    rowMap['interestsName'] = interestsName;
    return rowMap;
  }
}