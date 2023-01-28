
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late double screenHeight, screenWidth;
  bool isOpenMenu = false;
  // late AnimationController animationController;
  // late Animation scaleAnimation;
  Duration duration = const Duration(milliseconds: 500);

  // @override
  // void initState() {
   
  //   super.initState();
  //   animationController = AnimationController(vsync: this, duration: duration);
  //   // scaleAnimation = Tween(begin: 1, end: .5).animate(animationController);
  // }

  // @override
  // void dispose() {
  //   animationController.dispose();
    
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Material App Bar'),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            const Menu(),
            dashBoard(),
          ],
        ),
      ),
    );
  }

  AnimatedPositioned dashBoard() {
    return AnimatedPositioned(
      top: isOpenMenu ? 0.02 * screenHeight : 0,
      bottom: isOpenMenu ? .02 * screenHeight : 0,
      left: isOpenMenu ? .4 * screenWidth : 0,
      right: isOpenMenu ? .02 * screenWidth : 0,
      duration: duration,
      child: Material(
        color: Colors.teal,
        borderRadius:
            isOpenMenu ? BorderRadius.circular(20) : BorderRadius.circular(0),
        elevation: 20,
        child: Container(
          
          padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isOpenMenu = !isOpenMenu;
                           
                          });
                        },
                        child: const Icon(Icons.menu)),
                    const Text('My Cards'),
                    const Icon(Icons.add_circle_outline),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                height: 300,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      color: Colors.red,
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    Container(
                      color: Colors.blue,
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    Container(
                      color: Colors.green,
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Dashboard'),
            SizedBox(
              height: 10,
            ),
            Text('Messages'),
            SizedBox(
              height: 10,
            ),
            Text('Utility Bills'),
            SizedBox(
              height: 10,
            ),
            Text('Fund Transfer'),
            SizedBox(
              height: 10,
            ),
            Text('Branches'),
          ],
        ),
      ),
    );
  }
}
