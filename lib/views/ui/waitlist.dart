import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:online_shop/models/orders/sneakers.dart';

import 'package:online_shop/models/orders/waitlist/get_wait_lists.dart';

import 'package:online_shop/services/waitlist_helper.dart';
import 'package:online_shop/views/shared/appstyle.dart';
import 'package:online_shop/views/shared/checkout_btn.dart';
import 'package:online_shop/views/ui/single_product_page/new_single_product_page.dart';
import 'package:online_shop/views/ui/non_userpage.dart';
import 'package:online_shop/views/ui/payment.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/waitlist_item.dart';

class WaiListPage extends StatefulWidget {
  WaiListPage({super.key});

  @override
  State<WaiListPage> createState() => _WaiListPageState();
}

class _WaiListPageState extends State<WaiListPage> {
  late Future<List<WaitlistItem>?> _cartList;
  List<WaitlistItem>? checkout;
  bool? isSelected = true;
  bool? isLogged;

  @override
  void initState() {
    super.initState();
    _cartList = WaitListHelper.getCartProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    AntDesign.close,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "WishList",
                  style: appstyle(36, Colors.black, FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.65,
                  child: FutureBuilder(
                      future: _cartList,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator.adaptive());
                        } else if (snapshot.hasError) {
                          return Text("Error ${snapshot.error}");
                        } else {
                          final products = snapshot.data;
                          checkout = products;
                          return ListView.builder(
                              itemCount: products!.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                final data = products[index];

                                return WaitListItemWidget(
                                  imageUrl: data.product!.images![1],
                                  productName: data.product!.name!,
                                  productCategory: data.product!.category!,
                                  productPrice: '${data.product?.price}',
                                  deleteClicked: () async {
                                    final response =
                                    await WaitListHelper.deletefromCart(
                                        data.product!.id!);
                                    _cartList = WaitListHelper.getCartProduct();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(response.message!)));
                                    Navigator.pop(context);
                                  },
                                  onPressed: () {
                                    StoreProduct mSneakers = new StoreProduct(id:  data.product.id
                                        ,
                                        images: data.product.images,
                                        stock:  data.product.stock,
                                        name:  data.product.name,
                                        title:  '',
                                        category:  data.product.category,
                                        oldPrice:  data.product.price.toString(),
                                        isSelected: isSelected,
                                        price:  data.product.price.toInt(),
                                        description:  data.product.description);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NewProductPage(sneakers: mSneakers)
                                        /*  SingleProductPage(
                                          productId: data.product!.id!,
                                        ),*/
                                      ),
                                    );
                                  },
                                );

                                /*GestureDetector(
                                        onTap: (){

                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(12)),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade100,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color:
                                                            Colors.grey.shade500,
                                                        spreadRadius: 5,
                                                        blurRadius: 0.3,
                                                        offset:
                                                            const Offset(0, 1)),
                                                  ]),
                                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets
                                                            .all(12),
                                                    child:
                                                        CachedNetworkImage(
                                                      // imageUrl: data.product?.imageUrl[1],
                                                      imageUrl: data.product!.images![1],
                                                      width: 70,
                                                      height: 70,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 12,
                                                            left: 20),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          data.product!.name!,
                                                          style: appstyle(
                                                              16,
                                                              Colors.black,
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          data.product!.category!,
                                                          style: appstyle(
                                                              14,
                                                              Colors.grey,
                                                              FontWeight
                                                                  .w600),
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
                                                              "\$${data.product?.price}",
                                                              style: appstyle(
                                                                  18,
                                                                  Colors
                                                                      .black,
                                                                  FontWeight
                                                                      .w600),
                                                            ),
                                                            const SizedBox(
                                                              width: 30,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Positioned(
                                                      bottom: -2,
                                                      child:
                                                      GestureDetector(
                                                        onTap: () async {
                                                          final response = await WaitListHelper
                                                              .deletefromCart(
                                                              data.product!.id!);
                                                          _cartList = WaitListHelper.getCartProduct();
                                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.message!)));
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Icon(
                                                          Fontisto.trash
                                                              ,
                                                          size: 20,
                                                          color: Colors
                                                              .redAccent,
                                                        ),
                                                      ),
                                                  )

                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );*/
                              });
                        }
                      }),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CheckoutButton(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  label: "Done"),
            ),
          ],
        ),
      ),
    );
  }
}
