import 'package:flutter/material.dart';
import 'package:online_shop/models/sneaker_model.dart';
import 'package:online_shop/services/helper.dart';
import 'package:online_shop/views/shared/appstyle.dart';
import 'package:online_shop/views/shared/home_widget.dart';

import '../../models/orders/sneakers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 8, vsync: this);

  late Future<List<StoreProduct>> _electronics;
  late Future<List<StoreProduct>> _furnitures;
  late Future<List<StoreProduct>> _vehicles;
  late Future<List<StoreProduct>> _mobilePhones;
  late Future<List<StoreProduct>> _television;
  late Future<List<StoreProduct>> _laptop;
  late Future<List<StoreProduct>> _generator;
  late Future<List<StoreProduct>> _refridgerator;

  Future<void> getItems() async {
    _electronics = Helper().getProducts('electronics');
    _furnitures = Helper().getProducts('furnitures');
    _vehicles = Helper().getProducts('vehicles');
    _mobilePhones = Helper().getProducts('mobile phones');
    _television = Helper().getProducts('television');
    _laptop = Helper().getProducts('laptop');
    _generator = Helper().getProducts('generator');
    _refridgerator = Helper().getProducts('refridgerator');
  }

  @override
  void initState() {
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top_image.png"),
                      fit: BoxFit.cover)),
              child: Container(
                padding: const EdgeInsets.only(left: 8, bottom: 15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Exceeding",
                      style: appstyleWithHt(
                          42, Colors.white, FontWeight.bold, 1.5),
                    ),
                    Text(
                      "Properties",
                      style: appstyleWithHt(
                          42, Colors.white, FontWeight.bold, 1.2),
                    ),
                    TabBar(
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                      unselectedLabelColor: Colors.grey.withOpacity(0.3),
                      tabs: const [
                        Tab(
                          text: "Electronics",
                        ),
                        Tab(
                          text: "Furnitures",
                        ),
                        Tab(
                          text: "Vehicles",
                        ),
                        Tab(
                          text: "Mobile Phones",
                        ),
                        Tab(
                          text: "Television",
                        ),
                        Tab(
                          text: "Laptop",
                        ),
                        Tab(
                          text: "Generator",
                        ),
                        Tab(
                          text: "Refrigerator",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.25),
              child: Container(
                padding: const EdgeInsets.only(left: 12),
                child: TabBarView(controller: _tabController, children: [
                  HomeWidget(
                    product: _electronics,
                    tabIndex: 0,
                  ),
                  HomeWidget(
                    product: _furnitures,
                    tabIndex: 1,
                  ),
                  HomeWidget(
                    product: _vehicles,
                    tabIndex: 2,
                  ),
                  HomeWidget(
                    product: _mobilePhones,
                    tabIndex: 0,
                  ),
                  HomeWidget(
                    product: _television,
                    tabIndex: 1,
                  ),
                  HomeWidget(
                    product: _laptop,
                    tabIndex: 2,
                  ),
                  HomeWidget(
                    product: _generator,
                    tabIndex: 1,
                  ),
                  HomeWidget(
                    product: _refridgerator,
                    tabIndex: 2,
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
