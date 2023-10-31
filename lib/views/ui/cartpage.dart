import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:online_shop/controllers/cart_provider.dart';
import 'package:online_shop/controllers/login_provider.dart';
import 'package:online_shop/controllers/payment_provider.dart';
import 'package:online_shop/models/cart/get_products.dart';
import 'package:online_shop/models/orders/orders_req.dart';
import 'package:online_shop/services/cart_helper.dart';
import 'package:online_shop/services/payment_helper.dart';
import 'package:online_shop/views/shared/appstyle.dart';
import 'package:online_shop/views/shared/checkout_btn.dart';
import 'package:online_shop/views/ui/non_userpage.dart';
import 'package:online_shop/views/ui/payment.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Future<List<Product>> _cartList;
  List<Product>? checkout;
  bool? isSelected = true;
  bool? isLogged;

  @override
  void initState() {
    super.initState();
    _cartList = CartHelper.getCart();
  }

  @override
  Widget build(BuildContext context) {
    var paymentNotifier = Provider.of<PaymentNotifier>(context);
    var cartProvider = Provider.of<CartProvider>(context, listen: false);
    return paymentNotifier.paymentUrl.contains("https")
        ? const PaymentWebView()
        : Scaffold(
            backgroundColor: const Color(0xFFE2E2E2),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: Stack(
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
                        "My Cart",
                        style: appstyle(36, Colors.black, FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: FutureBuilder(
                            future: _cartList,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child:
                                        CircularProgressIndicator.adaptive());
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

                                      return Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(12)),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.11,
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
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl: data
                                                                .cartItem
                                                                .imageUrl[1],
                                                            width: 70,
                                                            height: 70,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                        Positioned(
                                                            bottom: -2,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () async {
                                                                await CartHelper
                                                                    .deleteItem(
                                                                        data.id);
                                                                _cartList =
                                                                    CartHelper
                                                                        .getCart();
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                width: 40,
                                                                height: 30,
                                                                decoration: const BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                    borderRadius:
                                                                        BorderRadius.only(
                                                                            topRight:
                                                                                Radius.circular(12))),
                                                                child:
                                                                    const Icon(
                                                                  AntDesign
                                                                      .delete,
                                                                  size: 20,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ))
                                                      ],
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
                                                            data.cartItem.name,
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
                                                            data.cartItem
                                                                .category,
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
                                                                "\$${data.cartItem.price}",
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
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        decoration: const BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            16))),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            InkWell(
                                                                onTap: () {
                                                                  cartProvider
                                                                      .decrement();
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  AntDesign
                                                                      .minussquare,
                                                                  size: 20,
                                                                  color: Colors
                                                                      .grey,
                                                                )),
                                                            Text(
                                                              cartProvider
                                                                  .counter
                                                                  .toString(),
                                                              style: appstyle(
                                                                16,
                                                                Colors.black,
                                                                FontWeight.w600,
                                                              ),
                                                            ),
                                                            InkWell(
                                                                onTap: () {
                                                                  cartProvider
                                                                      .increment();
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  AntDesign
                                                                      .plussquare,
                                                                  size: 20,
                                                                  color: Colors
                                                                      .black,
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    // ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
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
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String userId = prefs.getString('userId') ?? "";
                          Order model = Order(userId: userId, cartItems: [
                            CartItem(
                                name: checkout![0].cartItem.name,
                                id: checkout![0].cartItem.id,
                                price: checkout![0].cartItem.price,
                                cartQuantity: 1)
                          ]);
                          PaymentHelper.payment(model).then((value) {
                            paymentNotifier.paymentUrl = value;
                           
                          });
                        },
                        label: "Proceed to Checkout"),
                  ),
                ],
              ),
            ),
          );
  }
}
