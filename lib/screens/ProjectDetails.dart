import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_projects/models/Member.dart';
import 'package:my_projects/models/Project.dart';

import '../UtilsFunctions.dart';

class ProjectDetails extends StatefulWidget {
  Project project = new Project("", "", "", 0, "", "", [], []);

  ProjectDetails(this.project);

  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xffe6eef7),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, bottom: 8, left: 6, right: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        'assets/icons/back.svg',
                        color: Colors.black87,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: new AssetImage(
                                  'assets/avatars/054-woman-13.png'),
                              fit: BoxFit.contain,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 8.0, left: 8, top: 8, bottom: 8),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(UtilsFunctions.capitalizeSentence(
                                widget.project.title.trim())
                            .trim()),
                        leading: Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Center(
                            child: Container(
                              width: 48,
                              height: 48,
                              child: Image.network(
                                widget.project.image,
                                fit: BoxFit.contain,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                        subtitle: Text(
                          "Deadline " +
                              UtilsFunctions.convertDateFromString(
                                  widget.project.deadline, "MMM dd, yyyy"),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 8, bottom: 8),
                        child: Text(
                          "Progress",
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 12, top: 4, bottom: 8),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 4.0,
                              decoration: new BoxDecoration(
                                color: UtilsFunctions.getColorFromHex(
                                        widget.project.color)
                                    .withOpacity(0.3),
                                borderRadius: new BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                height: 4.0,
                                width: MediaQuery.of(context).size.width *
                                    widget.project.progress,
                                decoration: new BoxDecoration(
                                  color: UtilsFunctions.getColorFromHex(
                                      widget.project.color),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 12, top: 24, bottom: 8),
                        child: Text(
                          "Members",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 4),
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.project.members.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          widget.project.members[index].image,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 12, top: 16, bottom: 8),
                        child: Text(
                          "About Project",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 12, top: 4, bottom: 8),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Flexible(
                              flex: 9,
                              child: Text(
                                widget.project.about,
                                maxLines: descTextShowFlag ? 8 : 3,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 14),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      descTextShowFlag = !descTextShowFlag;
                                    });
                                  },
                                  child: Container(
                                    /** TODO
                                     * Make the height bigger
                                     */
                                    child: descTextShowFlag
                                        ? SvgPicture.asset(
                                            'assets/icons/up.svg',
                                            color: Colors.blueGrey,
                                            width: 12,
                                            height: 12)
                                        : SvgPicture.asset(
                                            'assets/icons/down.svg',
                                            color: Colors.blueGrey,
                                            width: 12,
                                            height: 12),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 8.0, left: 8, top: 16, bottom: 8),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 12, top: 16, bottom: 8),
                        child: Text(
                          "Files",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 4),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: widget.project.files.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Row(
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      flex: 4,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Center(
                                            child: Container(
                                              width: 48,
                                              height: 48,
                                              child: Image.network(
                                                widget
                                                    .project.files[index].image,
                                                fit: BoxFit.contain,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 9,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Text(widget
                                                .project.files[index].name),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(widget.project.files[index]
                                                .lastTimeUpdated),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Text('By'),
                                                SizedBox(
                                                  height: 20,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 4.0),
                                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: widget
                                                            .project
                                                            .files[index]
                                                            .members
                                                            .length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index1) {
                                                          return Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          1.0),
                                                              child: Container(
                                                                width: 20,
                                                                height: 20,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0),
                                                                  child: Image
                                                                      .network(
                                                                    widget
                                                                        .project
                                                                        .files[
                                                                            index]
                                                                        .members[
                                                                            index1]
                                                                        .image,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: SvgPicture.asset(
                                                'assets/icons/more.svg',
                                                color: Color(0xff8799ad),
                                                width: 16,
                                                height: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 44,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
