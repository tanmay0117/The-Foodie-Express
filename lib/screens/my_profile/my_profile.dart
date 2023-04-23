import 'package:flutter/material.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/home/drawer_side.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';

class ProfilePage extends StatefulWidget {
  UserProvider userProvider;
  ProfilePage({required this.userProvider});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget listTile(
      {required IconData iconData,
      required String title,
      required Function onTap}) {
    return GestureDetector(
      onTap: onTap(),
      child: Column(
        children: [
          Divider(
            height: 1,
          ),
          ListTile(
            leading: Icon(iconData),
            title: Text(title),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    // UserProvider userProvider = Provider.of(context);
    var userData = widget.userProvider.currentUserData;
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: DrawerSide(
        userProvider: widget.userProvider,
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(color: textColor),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: primaryColor,
                height: 100,
              ),
              Expanded(
                child: Container(
                    // height: 548,
                    // color: scaffoldBackgroundColor,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: scaffoldBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 250,
                              height: 80,
                              padding: EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userData.userName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: textColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        userData.userEmail,
                                      ),
                                    ],
                                  ), //name and email
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundColor: primaryColor,
                                    child: CircleAvatar(
                                      backgroundColor: scaffoldBackgroundColor,
                                      radius: 14,
                                      child: Icon(
                                        Icons.edit,
                                        color: primaryColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        listTile(
                          iconData: Icons.shop_outlined,
                          title: 'My Orders',
                          onTap: () {},
                        ),
                        listTile(
                          iconData: Icons.location_on_outlined,
                          title: 'My Delivery Addredd',
                          onTap: () {},
                        ),
                        listTile(
                          iconData: Icons.person_outline,
                          title: 'Refer a friend',
                          onTap: () {},
                        ),
                        listTile(
                          iconData: Icons.file_copy_outlined,
                          title: 'Terms & Condition',
                          onTap: () {},
                        ),
                        listTile(
                          iconData: Icons.policy_outlined,
                          title: 'Privacy Policy',
                          onTap: () {},
                        ),
                        listTile(
                          iconData: Icons.add_chart,
                          title: 'About',
                          onTap: () {},
                        ),
                        listTile(
                          iconData: Icons.exit_to_app,
                          title: 'Log Out',
                          onTap: () {},
                        ),
                      ],
                    )),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                backgroundImage: NetworkImage(userData.userImage ??
                    'https://s3.envato.com/files/328957910/vegi_thumb.png'),
                radius: 45,
                backgroundColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
