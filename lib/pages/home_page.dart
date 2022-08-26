import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'feed_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}):super(key:key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController controller;

  int currentPage=0;

  @override
  void initState() {
    // TODO: implement initState
    controller=PageController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Instagram",
          style: TextStyle(color: Colors.grey,),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt, color: Colors.grey,),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.tv, color: Colors.grey,),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send, color: Colors.grey,),
          ),
        ],
      ),

      body: PageView(
        controller: controller,
        onPageChanged: (int value){
          setState((){
            currentPage=value;
          });

        },
        children: [
          FeedPage(),
          FeedPage(),
          FeedPage(),
          FeedPage(),
          FeedPage(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(

        currentIndex: currentPage,

        onTap: (int index) {
          setState(() {
            currentPage = index;
            controller.animateToPage(index,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn);
          });
        },
        items:  [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box,
              color: Colors.black,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.black,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
              size: 32,
            ),
          ),

        ],

      ),
    );

  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}
