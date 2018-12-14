
import 'package:flutter/material.dart';
import 'package:flutter_sliding_nav/flutter_sliding_nav.dart';
import 'text_button.dart';
import 'non_existent_appbar.dart';

class HomePage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => new HomePageState();

} 

class HomePageState extends State<HomePage> {

  num selectedPage = 1;
  SlidingRoot slidingRoot;

  Widget getSelectedPage() {

    switch (selectedPage) {
      case 1:
        return new Text(
          "My Feed Page!!!! \n Swipe right to reveal the back widget"
        );

      case 2:
        return new Text(
          "Me page!!!! \n Swipe right to reveal the back widget"
        );

      case 3:
        return new Text(
          "Trending page!!!! \n Swipe right to reveal the back widget"
        );

      case 4:
        return new Text(
          "Near You page!!!! \n Swipe right to reveal the back widget"
        );
      
      case 5:
        return new Text(
          "Search page!!!! \n Swipe right to reveal the back widget"
        );
      
      case 6:
        return new Text(
          "Notifications page!!!! \n Swipe right to reveal the back widget"
        );
      
      case 7:
        return new Text(
          "Settings page!!!! \n Swipe right to reveal the back widget"
        );

      default:
        // Shouldn't happen though :P
        return new Text(
          "My Feed Page!!!! \n Swipe right to reveal the back widget"
        );
    }

  }

  void updateSelectedPage(num newIndex, BuildContext context) {
    if (selectedPage != newIndex) {
      setState(() {
        selectedPage = newIndex;
      });
    }

    slidingRoot.getState().closeBack();
  }

  @override
  Widget build(BuildContext context) {

    slidingRoot = new SlidingRoot(
        back: new Container(
          
          decoration: new BoxDecoration(color: Colors.white),
          padding: EdgeInsets.fromLTRB(20.0, 40.0, 0.0, 40.0),
          child: new Column(
            
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,

            children: [ 
              new Container(
                child: new TextButton(
                  buttonText: "direct",
                  buttonActive: selectedPage == 0,
                  onTap: () {
                    updateSelectedPage(0, context);
                  }
                ),
              ),
              new Container(
                child: new TextButton(
                  buttonText: "my feed",
                  buttonActive: selectedPage == 1,
                  onTap: () {
                    updateSelectedPage(1, context);
                  }
                ),
              ),
              new Container(
                child: new TextButton(
                  buttonText: "me",
                  buttonActive: selectedPage == 2,
                  onTap: () {
                    updateSelectedPage(2, context);
                  }
                ),
              ),
              new Container(
                child: new TextButton(
                  buttonText: "trending",
                  buttonActive: selectedPage == 3,
                  onTap: () {
                    updateSelectedPage(3, context);
                  }
                ),
              ),
              new Container(
                child: new TextButton(
                  buttonText: "near you",
                  buttonActive: selectedPage == 4,
                  onTap: () {
                    updateSelectedPage(4, context);
                  }
                ),
              ),
              new Container(
                child: new TextButton(
                  buttonText: "search",
                  buttonActive: selectedPage == 5,
                  onTap: () {
                    updateSelectedPage(5, context);
                  }
                ),
              ),
              new Container(
                child: new TextButton(
                  buttonText: "notifications",
                  buttonActive: selectedPage == 6,
                  onTap: () {
                    updateSelectedPage(6, context);
                  }
                ),
              ),
              new Container(
                child: new TextButton(
                  buttonText: "settings",
                  buttonActive: selectedPage == 7,
                  onTap: () {
                    updateSelectedPage(7, context);
                  }
                ),
              )
            ]
            
          )
        ),

        front: new Container(
          decoration: new BoxDecoration(color: Colors.black),

          child: getSelectedPage()
        )
      );

    return new Scaffold(
      appBar: new NonExistentAppBar(),
      body: slidingRoot
    );
  }

}