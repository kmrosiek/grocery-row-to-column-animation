import 'package:flutter/material.dart';
import 'package:grocery/presentation/common/dim.dart';
import 'package:grocery/presentation/home/products_grid/products_grid.dart';
import 'package:grocery/presentation/home/home_header/home_header.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  double flex1 = 1.0;
  double flex2 = 2.0;
  int f1 = 5;
  int f2 = 1;
  bool expanded = false;

  late final AnimationController _animationController;
  late final Animation<int> _flex;

  @override
  void initState() {
    super.initState();

    // Define the duration of the animation in the controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _flex = IntTween(
      // Define the flex values between which should be animated.
      begin: 7500,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.000,
          1.000,
          // Choose a curve to change animation speed acceleration
          curve: Curves.fastEaseInToSlowEaseOut,
        ),
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          //_animationController.reset();
          expanded = !expanded;
          /*if (_animationController.isCompleted) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }*/
        });
      }),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: true
              ? _do
              : true
                  ? AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Column(
                          children: [
                            Expanded(
                              flex: 8500 - _flex.value,
                              child: Container(
                                  color: Colors.lightBlue,
                                  child: Text('Fixed height container')),
                            ),
                            Expanded(
                              flex: 700 + _flex.value,
                              child: Container(
                                color: Colors.orange,
                                child: Text('Flexible container'),
                              ),
                            ),
                          ],
                        );
                      })
                  : true
                      ? AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Column(children: [
                              Expanded(
                                flex: f1,
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                  //height: MediaQuery.of(context).size.height / 2 * flex1 / 3,
                                  child: Container(
                                    color: Colors.blue,
                                    child: Center(
                                      child: Text('Widget 1',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: f2,
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                  //height: MediaQuery.of(context).size.height / 2 * flex2 / 3,
                                  child: Container(
                                    color: Colors.green,
                                    child: Center(
                                      child: Text(
                                        'Widget 2',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    flex1 = 2.0;
                                    f2 = f1;
                                    f1 = 1;
                                    flex2 = 1.0;
                                  });
                                },
                                child: Text('Toggle Flex'),
                              ),
                            ]);
                          })
                      : Column(
                          children: [
                            HomeHeader(),
                            SizedBox(height: Dim.padding),
                            Expanded(child: ProductsGrid()),
                          ],
                        ),
        ),
      ),
    );
  }

  Widget get _do => Builder(builder: (context) {
        final screenHeight = MediaQuery.of(context).size.height;
        return Column(
          children: [
            Expanded(
              child: Container(
                  color: Colors.lightBlue,
                  child: Text('Fixed height container')),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.fastEaseInToSlowEaseOut,
              color: Colors.orange,
              height: expanded ? 0.75 * screenHeight : 80,
              child: Text('Flexible container'),
            ),
          ],
        );
      });
}
