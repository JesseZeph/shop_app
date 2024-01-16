import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../services/waitlist_helper.dart';
import 'appstyle.dart';

class WaitListItemWidget extends StatelessWidget {
  const WaitListItemWidget(
      {super.key,
      required this.imageUrl,
      required this.productName,
      required this.productCategory,
      required this.productPrice,
      this.deleteClicked,
      this.onPressed});

  final String imageUrl;
  final String productName;
  final String productCategory;
  final String productPrice;
  final void Function()? onPressed;
  final void Function()? deleteClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedNetworkImage(
              // imageUrl: data.product?.imageUrl[1],
              imageUrl: imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.fill,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: appstyle(16, Colors.black, FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  productCategory,
                  style: appstyle(14, Colors.grey, FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$$productPrice",
                      style: appstyle(18, Colors.black, FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: deleteClicked,
              child: const Icon(
                Fontisto.trash,
                size: 20,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
