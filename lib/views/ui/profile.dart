import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:online_shop/controllers/login_provider.dart';
import 'package:online_shop/models/orders/general_user.dart';
import 'package:online_shop/services/auth_helper.dart';
import 'package:online_shop/views/shared/appstyle.dart';
import 'package:online_shop/views/shared/tiles_widget.dart';
import 'package:online_shop/views/ui/auth/login.dart';
import 'package:online_shop/views/ui/waitlist.dart';
import 'package:online_shop/views/ui/cartpage.dart';
import 'package:online_shop/views/ui/favorites.dart';
import 'package:online_shop/views/ui/non_userpage.dart';
import 'package:online_shop/views/ui/orders/orders.dart';
import 'package:online_shop/views/ui/payments/failed.dart';
import 'package:online_shop/views/ui/payments/successful.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool? isLogged;
  Future<GeneralUser>? profile;


  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogged = prefs.getBool("loggedIn") ?? false;
    if (isLogged == true) {
      profile = AuthHelper.getUserProfile();

      final newProfile = AuthHelper.getUserProfile();
      if (newProfile.toString().contains('Server error')){
        isLogged = false;
      }

    } else {}
  }

  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);

    return loginNotifier.loggedIn == false
        ? const NonUser()
        : Scaffold(
            backgroundColor: const Color(0xFFE2E2E2),
            appBar: AppBar(
              backgroundColor: const Color(0xFFFFFFFF),
              elevation: 0,
              leading: const Icon(
                MaterialCommunityIcons.qrcode_scan,
                size: 18,
                color: Colors.black,
              ),
              actions: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/usa.svg",
                          width: 15,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 15,
                          width: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("USA",
                            style:
                                appstyle(16, Colors.black, FontWeight.normal)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Icon(
                            SimpleLineIcons.settings,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Padding(
                            padding:
                                const EdgeInsets.fromLTRB(12.0, 10, 16, 16),
                            child: Consumer<LoginNotifier>(
                                builder: (context, loginNotifier, child) {
                              return FutureBuilder<GeneralUser>(
                                future: profile,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator
                                            .adaptive());
                                  } else if (snapshot.hasError) {
                                    return Text("Error ${snapshot.error}");
                                  } else {
                                    final userData = snapshot.data;
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 35,
                                              width: 35,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey.shade100,
                                                backgroundImage: const AssetImage(
                                                    "assets/images/user.jpeg"),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                          userData?.data.username??"",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                        ),
                                                   Text(
                                                          userData?.data.email??"",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall,
                                                        ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                            onTap: () {},
                                            child: const Icon(Feather.edit,
                                                size: 18))
                                      ],
                                    );
                                  }
                                },
                              );
                            }))
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        // height: MediaQuery.of(context).size.height * 0.2,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TilesWidget(
                              OnTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                             const ProcessOrders()));
                              },
                              title: "My Orders",
                              leading: MaterialCommunityIcons.truck_fast_outline,
                            ),
                            TilesWidget(
                              OnTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Favorites()));
                              },
                              title: "My Favorites",
                              leading: MaterialCommunityIcons.heart_outline,
                            ),
                            TilesWidget(
                              OnTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CartPage()));
                              },
                              title: "Cart",
                              leading: Fontisto.shopping_bag_1,
                            ),
                            TilesWidget(
                              OnTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WaiListPage()));
                              },
                              title: "WishList",
                              leading: Fontisto.google_wallet,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        // height: MediaQuery.of(context).size.height * 0.13,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TilesWidget(
                              OnTap: () {
                                 Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Successful()));
                              },
                              title: "Coupons",
                              leading: MaterialCommunityIcons.tag_outline,
                            ),
                            TilesWidget(
                              OnTap: () {
                                 Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PaymentFailed()));},
                              title: "My Store",
                              leading: MaterialCommunityIcons.shopping_outline,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        // height: MediaQuery.of(context).size.height * 0.25,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TilesWidget(
                              OnTap: () {
                               
                              },
                              title: "Shipping addresses",
                              leading: SimpleLineIcons.location_pin,
                            ),
                            const TilesWidget(
                              title: "App Feedback",
                              leading: MaterialIcons.rss_feed,
                            ),
                            TilesWidget(
                              OnTap: () {},
                              title: "Settings",
                              leading: AntDesign.setting,
                            ),
                            TilesWidget(
                              OnTap: () {
                                loginNotifier.logout();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                              title: "Logout",
                              leading: AntDesign.logout,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
