import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:online_shop/controllers/product_provider.dart';
import 'package:online_shop/models/sneaker_model.dart';
import 'package:online_shop/views/shared/appstyle.dart';
import 'package:online_shop/views/shared/new_shoes.dart';
import 'package:online_shop/views/shared/product_card.dart';
import 'package:online_shop/views/ui/product_by_cat.dart';
import 'package:online_shop/views/ui/product_page.dart';
import 'package:provider/provider.dart';

import '../../models/orders/sneakers.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<StoreProduct>> product,
    required this.tabIndex,
  }) : _male = product;
  final Future<List<StoreProduct>> _male;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.405,
            child: FutureBuilder<List<StoreProduct>>(
                future: _male,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Fontisto.trash),
                          Text(
                            "Please Check your\ninternet connection",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                    return Text("Error ${snapshot.error} ");
                  } else if (!snapshot.hasData) {
                    return Text("Error This guy is empty");
                  } else {
                    final male = snapshot.data;
                    return ListView.builder(
                        itemCount: male!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final shoe = snapshot.data![index];
                          return GestureDetector(
                            onTap: () {
                              // productNotifier.shoesSizes = shoe.sizes;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductPage(
                                            sneakers: shoe,
                                          )));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 16),
                              child: ProductCard(
                                price: "\$${shoe.price}",
                                category: shoe.category ?? "",
                                id: 'shoe.id',
                                name: shoe.name ?? "",
                                image: shoe.images[0],
                              ),
                            ),
                          );
                        });
                  }
                })),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest ",
                    style: appstyle(24, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductByCat(
                                    tabIndex: tabIndex,
                                  )));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Show All",
                          style: appstyle(22, Colors.black, FontWeight.w500),
                        ),
                        const Icon(
                          AntDesign.caretright,
                          size: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: FutureBuilder<List<StoreProduct>>(
                future: _male,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  } else {
                    final male = snapshot.data;
                    return ListView.builder(
                        itemCount: male!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final shoe = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NewShoes(
                              onTap: () {
                                // productNotifier.shoesSizes = shoe.sizes;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductPage(
                                              sneakers: shoe,
                                            )));
                              },
                              imageUrl: shoe.images[1],
                            ),
                          );
                        });
                  }
                })),
      ],
    );
  }
}
