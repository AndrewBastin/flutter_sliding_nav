library flutter_sliding_nav;

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SlidingRootState extends State<SlidingRoot> with SingleTickerProviderStateMixin {

  // Animation values
  bool animationEdgeStarted = false, isOpen = false;
  double slideProgress = 0.0;
  CurvedAnimation slideAnimation;
  AnimationController slideController;

  @override
  void initState() {
    super.initState();

    slideController = new AnimationController(
      vsync: this,
      upperBound: 1.0,
      lowerBound: 0.0,
      duration: new Duration(milliseconds: 500)
    );
    
    slideAnimation = new CurvedAnimation(curve: Curves.easeIn, parent: slideController);
    
    slideAnimation.addListener(() {
      
      setState(() {
        slideProgress = slideAnimation.value;
        isOpen = (slideAnimation.value == 0) ? false : true;
      });

    });
  }


  dispose() {
    slideController.dispose();

    super.dispose();
  }

  void closeBack() {
    slideController.fling(velocity: -1.0);
  }

  void openBack() {
    slideController.fling(velocity: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    
    return new Container(
      child: new Stack(
        children: [
          new Positioned.fill(
            child: widget.back,
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            top: 0.0,
          ),
          new Positioned.fill(
            child: new GestureDetector(
              
              onHorizontalDragStart: (details) {
                if (details.globalPosition.dx < 30) animationEdgeStarted = true;
                else animationEdgeStarted = false;
              },

              onHorizontalDragUpdate: (details) {
                if (animationEdgeStarted || isOpen) slideController.value = details.globalPosition.dx / 504;
              },

              onHorizontalDragEnd: (details) {
                if (animationEdgeStarted || isOpen) slideController.fling(velocity: details.primaryVelocity / 1000);
                animationEdgeStarted = false;
              },

              onTap: () {
                if (slideProgress >= 1) {
                  slideController.fling(velocity: -1.0);
                }
              },

              child: new Transform(
                transform: new Matrix4.identity()..scale(1.0 - (slideProgress / 2), 1.0 - (slideProgress / 2), 1.0),
                alignment: Alignment.center,
                child: widget.front
              )
            ),
            bottom: 0.0,
            left: slideProgress * 200,
            right: 0 - slideProgress * 200,
            top: 0.0,
          ),
        ]
      )
    );

  }

}

class SlidingRoot extends StatefulWidget {
  
  final Widget back;
  final Widget front;

  static SlidingRootState of(BuildContext context) => context.ancestorStateOfType(const TypeMatcher<SlidingRootState>());

  SlidingRoot({
    @required this.back,
    @required this.front
  }): super(key: GlobalKey());

  @override
  State<StatefulWidget> createState() => new SlidingRootState();

  SlidingRootState getState() {
    if (key is GlobalKey) {
      return (key as GlobalKey).currentState;
    } else return null;
  }
    
}
