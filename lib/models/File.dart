import 'package:my_projects/models/Member.dart';

class File {
  String image;
  String name;
  String lastTimeUpdated;
  List<Member> members = [];

  File(this.image, this.name, this.lastTimeUpdated, this.members);
}
