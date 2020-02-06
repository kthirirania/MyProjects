import 'package:my_projects/models/File.dart';
import 'package:my_projects/models/Member.dart';

class Project {
  String image;
  String title;
  String deadline;
  double progress;
  String color;
  String about;
  List<Member> members;
  List<File> files;

  Project(this.image, this.title, this.deadline, this.progress, this.color, this.about,
     this.members, this.files);

}