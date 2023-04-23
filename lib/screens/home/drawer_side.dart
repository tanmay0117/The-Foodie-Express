import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/user_model.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:food_app/screens/my_profile/my_profile.dart';
import 'package:food_app/screens/review_cart/review_cart.dart';

import '../../providers/user_provider.dart';
// import 'package:food_app/screens/my_profile/my_profile.dart';

class DrawerSide extends StatefulWidget {
  UserProvider userProvider;
  DrawerSide({required this.userProvider});

  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
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
    var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        color: primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 43,
                      backgroundColor: Colors.white54,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(userData.userImage ??
                            'https://s3.envato.com/files/328957910/vegi_thumb.png'),
                        radius: 40,
                        backgroundColor: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userData.userName,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          userData.userEmail,
                        ),
                      ],
                    )
                  ],
                ),
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
                    builder: (context) => ProfilePage(
                      userProvider: widget.userProvider,
                    ),
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
