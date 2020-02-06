import 'Member.dart';
import 'Project.dart';
import 'File.dart';

class Data{

  static List<Project> createLists(){

    List<Member> members = [
      new Member(
          "https://drive.google.com/uc?export=view&id=1Ys39cycdk2lwBcmasJwAesYgYH7RjMMy",
          "",
          ""),
      new Member(
          "https://drive.google.com/uc?export=view&id=1-cEfiVtfrcNMNxDFIvZM3vG2lSYtmsvk",
          "",
          ""),
      new Member(
          "https://drive.google.com/uc?export=view&id=1_Gw8zH53C_ytYko6Mc463UvWDQi3uaOS",
          "",
          ""),
      new Member(
          "https://drive.google.com/uc?export=view&id=1hwWbkT5OhQuPdOLs-AX2dKkfUfxX5vtS",
          "",
          ""),
      new Member(
          "https://drive.google.com/uc?export=view&id=1fW8Vwvwlts_9yXuIxkprzH_qg9IECZdA",
          "",
          "")
    ];

    List<File> files = [
      new File("https://drive.google.com/uc?export=view&id=1JhP4sE56BBD896GuRd87zvUXlSgpwBqH", "OnBoarding Illustration", "08:00", members.sublist(1,3)),
      new File("https://drive.google.com/uc?export=view&id=1vtrgDiEgs8SkoMEfNtjN-1JZkWYHK5X1", "\"Add to Basket\" Wireframe", "10:45", members.sublist(0,3)),
      new File("https://drive.google.com/uc?export=view&id=1tTyo8K7dne4ZR3cv2oy9vAnJMawuE1WJ", "Images Set", "11:01", members.sublist(2,3)),
    ];

    return [
      new Project(
          "https://drive.google.com/uc?export=view&id=13DxRfuKNx47z22ISk4DG4UT9hO9gmuhx",
          "Social Media App",
          "2020-06-12 12:04:35",
          0.60,
          "63C4F2",
          "Social Media App is an American microblogging and social networking service on "
              "which users post and interact with messages known as \"tweets\". Registered users "
              "can post, like, and retweet tweets, but unregistered users can only read them",
          members, files),
      new Project(
          "https://drive.google.com/uc?export=view&id=1v2R4XmmiWH6tzXPXNNHjpGvi5w8D79Sq",
          "event app", "2020-04-10", 0.70, "E35335", "Social Media App is an American microblogging and social networking service on "
          "which users post and interact with messages known as \"tweets\". Registered users "
          "can post, like, and retweet tweets, but unregistered users can only read them",
          members.sublist(1,3), files),
      new Project(
          "https://drive.google.com/uc?export=view&id=1G1AujV3TUUtHcsjTK7opTOLYsqogbpR1",
          "Instante Social Media App", "2020-02-28 12:04:35", 0.80, "FACF24", "Social Media App is an American microblogging and social networking service on "
          "which users post and interact with messages known as \"tweets\". Registered users "
          "can post, like, and retweet tweets, but unregistered users can only read them",
          members.sublist(0,3), files),
      new Project(
          "https://drive.google.com/uc?export=view&id=1j2Mo7EROTwEYVMVDDOI8-SNEWvbTOM3s",
          "Music Streaming App", "2021-01-01 12:04:35", 0.20, "50B95C", "Social Media App is an American microblogging and social networking service on "
          "which users post and interact with messages known as \"tweets\". Registered users "
          "can post, like, and retweet tweets, but unregistered users can only read them",
          members.sublist(2,4), files),
      new Project(
          "https://drive.google.com/uc?export=view&id=1wsBPm6ZFsEO007X8THXw_Ouz7PTdC0D4",
          "Cloud File Storage", "2020-04-10", 0.5, "3CAFE6", "Social Media App is an American microblogging and social networking service on "
          "which users post and interact with messages known as \"tweets\". Registered users "
          "can post, like, and retweet tweets, but unregistered users can only read them",
          members.sublist(1,4), files),
      new Project(
          "https://drive.google.com/uc?export=view&id=1EJAGf3vn1Cy2gcVkVlS28kIdXtcqWp1h",
          "Video Sharing App", "2020-03-22", 0.65, "E35335", "Social Media App is an American microblogging and social networking service on "
          "which users post and interact with messages known as \"tweets\". Registered users "
          "can post, like, and retweet tweets, but unregistered users can only read them",
          members.sublist(0,4), files),
    ];

  }

}