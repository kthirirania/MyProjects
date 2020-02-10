import 'package:flutter/material.dart';
import 'package:my_projects/Widgets/LoadImage.dart';
import 'package:my_projects/models/Data.dart';
import 'package:my_projects/models/Member.dart';
import 'package:my_projects/models/Project.dart';
import 'package:my_projects/models/File.dart';
import 'package:my_projects/screens/ProjectDetails.dart';

import '../UtilsFunctions.dart';

class ProjectsTab extends StatefulWidget {

  @override
  _ProjectsTabState createState() => _ProjectsTabState();

}

class _ProjectsTabState extends State<ProjectsTab> {

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: Data.createLists().length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProjectDetails(Data.createLists()[index])),
                      );
                    },
                    child: Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.all(
                          new Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              title: Text(
                                  UtilsFunctions.capitalizeSentence(
                                      Data.createLists()[index].title
                                      .trim())
                                      .trim()),
                              leading: LoadImage(Data.createLists()[index].image, 60, 60, 4, 12, 0, false),
                              subtitle: Text(
                                UtilsFunctions.convertDateFromString(
                                    Data.createLists()[index].deadline,
                                    "MMM dd, yyyy"),
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ),
                          Stack(
                            children: <Widget>[
                              new Container(
                                height: 8.0,
                                decoration: new BoxDecoration(
                                  color: UtilsFunctions.getColorFromHex(Data.createLists()[index].color).withOpacity(0.3),
                                  borderRadius:
                                  new BorderRadius.only(
                                    bottomRight:Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                  ),
                                ),
                              ),
                              new Positioned(
                                child: Container(
                                  height: 8.0,
                                  width: MediaQuery.of(context)
                                      .size
                                      .width * Data.createLists()[index].progress,
                                  decoration: new BoxDecoration(
                                    color: UtilsFunctions.getColorFromHex(Data.createLists()[index].color),
                                    borderRadius:
                                    new BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                        bottomLeft: Radius.circular(12),
                                        topRight: Radius.circular(12)
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
