import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:online_shop/controllers/product_provider.dart';
import 'package:online_shop/models/sneaker_model.dart';
import 'package:online_shop/services/helper.dart';
import 'package:online_shop/views/shared/appstyle.dart';
import 'package:online_shop/views/shared/custom_field.dart';
import 'package:online_shop/views/ui/product_page.dart';
import 'package:provider/provider.dart';

import '../../models/orders/sneakers.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);

    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100.h,
          iconTheme: const IconThemeData(color: Colors.white),
          title: CustomField(
            hintText: "Search using name or description",
            controller: search,
            onEditingComplete: () {
              setState(() {});
            },
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: const Icon(AntDesign.search1)),
            prefixIcon: GestureDetector(
                onTap: () {},
                child: const Icon(
                  AntDesign.camera,
                  color: Colors.black,
                )),
          ),
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: search.text.isNotEmpty
            ? FutureBuilder<List<StoreProduct>>(
                future: Helper().search(search.text),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  } else if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  } else if (snapshot.data!.isEmpty) {
                    return Image.asset("assets/images/Pose23.png");
                  } else {
                    final shoes = snapshot.data;
                    return ListView.builder(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        itemCount: shoes!.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final shoe = shoes[index];
                          return GestureDetector(
                            onTap: () {
                              // productNotifier.shoesSizes = shoe.sizes;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductPage(sneakers: shoe)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.11,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade500,
                                            spreadRadius: 5,
                                            blurRadius: 0.3,
                                            offset: const Offset(0, 1)),
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: CachedNetworkImage(
                                              imageUrl: shoe.images[0],
                                              width: 70,
                                              height: 70,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12, left: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  shoe.name ?? "",
                                                  style: appstyle(
                                                      16,
                                                      Colors.black,
                                                      FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  shoe.category ?? '',
                                                  style: appstyle(
                                                      14,
                                                      Colors.grey,
                                                      FontWeight.w600),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "\$ ${shoe.price}",
                                                      style: appstyle(
                                                          18,
                                                          Colors.black,
                                                          FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                })
            : Container(
                height: 600,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(right: 50),
                child: Image.asset("assets/images/Pose23.png"),
              ));
  }
}
