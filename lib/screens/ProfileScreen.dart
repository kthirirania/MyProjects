import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_projects/Widgets/IconImage.dart';
import 'package:my_projects/Widgets/LoadImage.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  int currentIndex = 4;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _launched;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xff4873a3),
        statusBarIconBrightness: Brightness.light));
  }

  @override
  Widget build(BuildContext context) {

    const String _linkdin = 'https://www.linkedin.com/in/rania-kthiri/';
    const String _github = 'https://github.com/kthirirania';
    const String _phone = '+21692503078';
    const String _email = "raniakthiri@icloud.com";

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xff4873a3),
        statusBarIconBrightness: Brightness.light));

    return Container(
      //height: 340,
      decoration: new BoxDecoration(
        color: Color(0xff4873a3),
        /*
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10.0,
            spreadRadius: 4.0,
            offset: Offset(4.0, 4.0,),
          ),
        ],
        borderRadius: new BorderRadius.only(
          bottomLeft: new Radius.circular(24),
          bottomRight: new Radius.circular(24),
        ),*/
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            LoadImage(
                "https://drive.google.com/uc?export=view&id=1UFVwHjuoUQSK1SqYIQ6TjWUVJVjM_fNx",
                120,
                120,
                0,
                60,
                60,
                false),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                "Rania Kthiri",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                "Mobile Developer",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Text(
                "rania.kthiri@icloud.com",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                    onTap: () => _launched = _makePhoneCall('tel:$_phone'),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconImage("phone"),
                    ),
                  ),
                  InkWell(
                    onTap: () => _launchEmail(_email),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconImage("mail"),
                    ),
                  ),
                  InkWell(
                    onTap: () =>  _launched = _launchInWebViewWithDomStorage(_linkdin),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconImage("linkedin"),
                    ),
                  ),
                  InkWell(
                    onTap: () =>  _launched =_launchInWebViewWithDomStorage(_github),
                    splashColor: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconImage("github"),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<void>(future: _launched, builder: _launchStatus)
          ],
        ),
      ),
    );
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }
    /*else if (snapshot.connectionState == ConnectionState.none) {
      return Column(
        children: <Widget>[
          Icon(Icons.wifi, size: 24, color: Colors.white,),
          Text('Check your Internet Connection'),
        ],
      );
    } */else {
      return const Text('');
    }
  }

  Future<void> _makePhoneCall(String phone) async {
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }


  Future<void> _launchEmail(String email) async {
    if (await canLaunch("mailto:$email")) {
      await launch("mailto:$email");
    } else {
      throw 'Could not launch';
    }
  }

  /*
  _launchEmail() async {
    // ios specification
    final String subject = "Subject:";
    final String stringText = "Same Message:";
    String uri = 'mailto:administrator@gmail.com?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(stringText)}';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      print("No email client found");
    }
  }
   */


  Future<void> _launchInWebViewWithDomStorage(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableDomStorage: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

}

/*
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0, left:10 ),
              child: Text('Technical Skills', style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20,
              ),),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 12),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: Data.about()[1].files.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          width: 100,
                          decoration: new BoxDecoration(
                            color: Color(0x11300CC9),
                            borderRadius: BorderRadius.all( Radius.circular(8),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              LoadImage(Data.about()[1].files[index].image, 50,50,0,0,0,false),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(Data.about()[1].files[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0, left:10 ),
              child: Text('Soft Skills', style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20,
              ),),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 12),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: Data.about()[1].files.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          width: 100,
                          decoration: new BoxDecoration(
                            color: Color(0x11300CC9),
                            borderRadius: BorderRadius.all( Radius.circular(8),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              LoadImage(Data.about()[1].files[index].image, 50,50,0,0,0,false),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(Data.about()[1].files[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),*/

/*
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0, left:10 ),
              child: Text('Other Projects', style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20,
              ),),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 12),
                child: ListView.builder(
                    shrinkWrap: true,
                    addRepaintBoundaries: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: Data.about()[1].files.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          width: 100,
                          decoration: new BoxDecoration(
                            color: Color(0x11300CC9),
                            borderRadius: BorderRadius.all( Radius.circular(8),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              LoadImage(Data.about()[1].files[index].image, 50,50,0,0,0,false),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(Data.about()[1].files[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
*/
