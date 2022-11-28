import 'package:flutter/cupertino.dart';
import 'package:resum_app_project/models/experience_model.dart';
import 'package:resum_app_project/models/skills_model.dart';

import '../models/interests_model.dart';

class CvProvider extends ChangeNotifier {
  /// Skills
  List<SkillsModel> skills = [];

  void setSkills (List<SkillsModel> skill){
    skills = skill;
  }

  /// Create
  void addSkill(SkillsModel skill) {
    skills.add(skill);
    notifyListeners();
  }
  /// Update
  void updateSkill(SkillsModel skill){
    int index = skills.indexWhere((element) => element.id == skill.id);
    skills.removeAt(index);
    skills.insert(index, skill);
    notifyListeners();
  }
  /// Delete
  void deleteSkill(int id) {
    skills.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  /// Interests
  List<InterestsModel> interests = [];
  void setInterests(List<InterestsModel> interest){
    interests = interest;
  }

  /// Create
  void addInterests(InterestsModel interest) {
    interests.add(interest);
    notifyListeners();
  }
  /// Update
  void updateInterests(InterestsModel interest){
    int index = interests.indexWhere((element) => element.id == interest.id);
    interests.removeAt(index);
    interests.insert(index, interest);
    notifyListeners();
  }
  /// Delete
  void deleteInterest(int id) {
    interests.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  /// Experience
  List<ExperienceModel> experiences = [];
  void setExperience(List<ExperienceModel>experience){
    experiences = experience;
  }
  /// Create
  void addExperience(ExperienceModel experience) {
    experiences.add(experience);
    notifyListeners();
  }
  /// Update
 void updateExperience(ExperienceModel experience){
    int index = experiences.indexWhere((element) => element.id == experience.id);
    experiences.removeAt(index);
    experiences.insert(index, experience);
    notifyListeners();
  }
  /// Delete
  void deleteExperience(int id) {
    experiences.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
