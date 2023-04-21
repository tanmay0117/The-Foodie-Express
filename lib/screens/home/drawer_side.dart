import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:food_app/screens/my_profile/my_profile.dart';
import 'package:food_app/screens/review_cart/review_cart.dart';
// import 'package:food_app/screens/my_profile/my_profile.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({Key? key}) : super(key: key);

  Widget listTile(
      {required IconData iconData,
      required String title,
      required Null Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(iconData),
        title: Text(title),
        // onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool _debugLocked = false;
    return Drawer(
      child: Container(
        color: primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 43,
                    backgroundColor: Colors.white54,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://s3.envato.com/files/328957910/vegi_thumb.png'),
                      radius: 40,
                      backgroundColor: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome Guest"),
                      SizedBox(
                        height: 7,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: TextStyle(color: textColor),
                        ),
                        style: OutlinedButton.styleFrom(
                          // elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            listTile(
                iconData: Icons.home_outlined,
                title: "Home",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                }),
            listTile(
              iconData: Icons.card_travel,
              title: "Review Cart",
              onTap: () {
                print('Navigating to Review Cart');
                Future.delayed(Duration.zero, () {
                  assert(!_debugLocked);

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ReviewCart()));
                });
              },
            ),
            listTile(
              iconData: Icons.person_outline,
              title: "My Profile",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
            ),
            listTile(
                iconData: Icons.notifications_outlined,
                title: "Notifications",
                onTap: () {}),
            listTile(
                iconData: Icons.star_outline,
                title: "Rating and Review",
                onTap: () {}),
            listTile(
                iconData: Icons.favorite_outline,
                title: "Wishlist",
                onTap: () {}),
            listTile(
                iconData: Icons.file_open_outlined,
                title: "Raise a Complaint",
                onTap: () {}),
            listTile(
                iconData: Icons.format_quote_sharp,
                title: "FAQs",
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
