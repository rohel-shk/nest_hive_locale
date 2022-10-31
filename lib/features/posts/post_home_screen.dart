import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:navigation_test/features/posts/post_screen.dart';
import 'package:navigation_test/generated/locale_keys.g.dart';
import 'package:navigation_test/router.dart';

class PostHome extends StatefulWidget {
  const PostHome({Key? key}) : super(key: key);

  @override
  State<PostHome> createState() => _PostHomeState();
}

class _PostHomeState extends State<PostHome> {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Post_home.tr()),
        actions: [
      Row(
      children: [
      InkWell(onTap: () async{
    await context.setLocale(Locale('en'));
    },child: Image.asset('assets/images/en.png',height: 30,width: 30,)),
    SizedBox(width: 10),
    InkWell(onTap: () async{
    await context.setLocale(Locale('ne'));
    },child: Image.asset('assets/images/np.png',height: 30,width: 30,)),
    SizedBox(width: 10)
    ],
    )
        ],
      ),
      body:
        Center(
          child: InkWell(
              onTap: (){postNav.currentState?.pushNamed(PostScreenNav.postListPath);},
              child: Text('This is post home')),
        ),

    );
  }
}
