import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veg_kitchen/constants/paddings.dart';
import 'package:veg_kitchen/constants/strings.dart';
import 'package:veg_kitchen/models/menu_item.dart';
import 'package:veg_kitchen/widgets/menu_item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenwidth = MediaQuery.of(context).size.width;
    final double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildRecommendedCard(screenwidth, screenheight),
          Padding(
            padding: EdgeInsets.only(
                bottom: MyPaddings().defaultPadding,
                left: MyPaddings().defaultPadding,
                right: MyPaddings().defaultPadding),
            child: Container(
                width: screenwidth * 0.8,
                height: screenheight * 0.3,
                child: PageView.builder(
                  itemCount: menuItems.length,
                  controller: PageController(viewportFraction: 0.9),
                  itemBuilder: (context, index) {
                    MenuItems item = menuItems[index];
                    return MenuItemCard(menuItem: item);
                  },
                )),
          ),
        ],
      ),
    );
  }

  Padding _buildRecommendedCard(double screenwidth, double screenheight) {
    return Padding(
      padding: EdgeInsets.all(MyPaddings().defaultPadding),
      child: Stack(
        children: [
          Container(
            width: screenwidth,
            height: screenheight * 0.4,
            child: Image.asset(
              MyStrings().recomendedRecipePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: screenwidth,
            height: screenheight * 0.4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.black54,
                Colors.black45,
                Colors.transparent,
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(MyPaddings().defaultPadding),
                child: Text(
                  MyStrings().RecommendCardText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenheight * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.chevron_right_outlined,
                color: Colors.white,
                size: screenwidth * 0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        MyStrings().AppBarText,
        style: GoogleFonts.pacifico(color: Colors.black),
      ),
    );
  }
}
