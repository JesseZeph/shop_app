import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:online_shop/models/orders/orders_res.dart';
import 'package:online_shop/services/cart_helper.dart';
import 'package:online_shop/views/shared/appstyle.dart';
import 'package:online_shop/views/shared/reusable_text.dart';

import '../../../models/orders/new_orders.dart';

class ProcessOrders extends StatefulWidget {
  const ProcessOrders({super.key});

  @override
  State<ProcessOrders> createState() => _ProcessOrdersState();
}

class _ProcessOrdersState extends State<ProcessOrders> {
  Future<List<PaidOrders>>? _orders;
  Future<List<Order>>? _newOrders;

  @override
  void initState() {
    super.initState();
    _orders = CartHelper.getOrders();
    _newOrders = CartHelper.fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Container(
              width: 325.w,
              height: 825.h,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                        text: "Orders",
                        style: appstyle(36, Colors.white, FontWeight.bold)),
                    Container(
                      width: 325.w,
                      height: 650.h,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: FutureBuilder(
                          future: _newOrders,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator.adaptive());
                            } else if (snapshot.hasError) {
                              return Text("Error ${snapshot.error}");
                            } else {
                              final products = snapshot.data;
                              return ListView.builder(
                                  itemCount: products!.length,
                                  padding: const EdgeInsets.only(top: 10),
                                  itemBuilder: (context, index) {
                                    final data = products[index];
                                    return Container(
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.all(8),
                                      height: 75,
                                      decoration: const BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          12))),
/*
                                                  child: Image.network(data
                                                      .productId.imageUrl[0])
*/
                                              ),
                                              const SizedBox(width: 8),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ReusableText(
                                                      text: data.address,
                                                      style: appstyle(
                                                          12,
                                                          Colors.black,
                                                          FontWeight.bold)),
                                                  ReusableText(
                                                      text:
                                                          "\$${data.totalPrice}",
                                                      style: appstyle(
                                                          12,
                                                          Colors.black,
                                                          FontWeight.w400)),
                                                  ReusableText(
                                                      text: data.id,
                                                      style: appstyle(
                                                          12,
                                                          Colors.black,
                                                          FontWeight.w400)),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 25),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.black,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          12))),
                                                  child: ReusableText(
                                                      text: data.paymentStatus
                                                          .toUpperCase(),
                                                      style: appstyle(
                                                          12,
                                                          Colors.white,
                                                          FontWeight.bold))),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    MaterialCommunityIcons
                                                        .truck_fast_outline,
                                                    size: 16,
                                                  ),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  ReusableText(
                                                      text: data.deliveryStatus
                                                          .toUpperCase(),
                                                      style: appstyle(
                                                          12,
                                                          Colors.black,
                                                          FontWeight.w400)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            }
                          }),
                    ),
                  ],
                ),
              )),
        ));
  }
}
