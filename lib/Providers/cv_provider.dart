import 'package:flutter/cupertino.dart';
import 'package:resum_app_project/models/skills_model.dart';

import '../models/interests_model.dart';

class CvProvider extends ChangeNotifier{

  /// Skills
  List<SkillsModel> skills = [];
  void addSkill(SkillsModel skill) {
    skills.add(skill);
    notifyListeners();
  }

  /// Interests
  List<InterestsModel> interests = [];
  void createInterests(InterestsModel interest) {
    interests.add(interest);
    notifyListeners();
  }


}