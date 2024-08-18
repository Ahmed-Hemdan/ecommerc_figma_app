import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class ProtraitProductCard extends StatelessWidget {
  final double value;
  final String image;
  final String title;
  final String description;
  final String price;
  final String? oldPrice;
  final String? sale;

  const ProtraitProductCard({
    super.key,
    required this.value,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    this.oldPrice,
    this.sale,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              height: 20.h,
              width: 45.w,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: const BoxConstraints(maxHeight: 20),
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(maxHeight: 40),
                  child: Text(
                    maxLines: 2,
                    description,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                Text(
                  price,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                ),
                oldPrice != '₹'
                    ? Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              oldPrice!,
                              style: const TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                          Text(
                            "$sale off",
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      )
                    : Container(),
                RatingStars(
                  value: value,
                  starBuilder: (index, color) => Icon(
                    Icons.star,
                    color: color,
                  ),
                  starCount: 5,
                  starSize: 20,
                  valueLabelVisibility: false,
                  maxValue: 5,
                  starSpacing: 1,
                  animationDuration: const Duration(milliseconds: 1000),
                  starOffColor: const Color(0xffe7e8ea),
                  starColor: Colors.yellow,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
