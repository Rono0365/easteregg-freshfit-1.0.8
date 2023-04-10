import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class GroceryAppPageView extends StatefulWidget {
  @override
  _GroceryAppPageViewState createState() => _GroceryAppPageViewState();
}

class _GroceryAppPageViewState extends State<GroceryAppPageView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [    Page1(),    Page2(),    Page3(),  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(9.0),
        child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 10.0,
                        width: 10.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.orange.withOpacity(0.7)
                              : Colors.grey.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.2),
              child: Icon(Icons.arrow_back)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/swick001.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  children: _pages,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              //SizedBox(height: 20.0),
              
              //SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'FreshFit',
            style: GoogleFonts.lato(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Get fresh and healthy groceries delivered right to your doorstep from local farmers near you!',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      alignment: Alignment.center,
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Save Money on Your Groceries!',
            style: GoogleFonts.lato(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Our app offers the best prices on high-quality produce and groceries, so you can save money while eating healthy!',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 18.0,
color: Colors.white,
),
),
SizedBox(height: 20.0),

],
),
);
}
}
class Page3 extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Container(
color: Colors.orange,
alignment: Alignment.center,
padding: EdgeInsets.all(20.0),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
'Fresh Produce from Local Farmers!',
style: GoogleFonts.lato(
fontSize: 32.0,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
SizedBox(height: 20.0),
Text(
'Our app partners with local farmers to bring you the freshest and healthiest produce. By supporting local farmers, you are also supporting your community!',
textAlign: TextAlign.center,
style: GoogleFonts.lato(
fontSize: 18.0,
color: Colors.white,
),
),
SizedBox(height: 20.0),

],
),
);
}
}