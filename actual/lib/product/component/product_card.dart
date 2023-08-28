import 'package:actual/common/const/colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight( /* spaceBetween 을 해도 꽉 안찰때! */
      /* IntrinsicHeight : 최대 높이로 하고 싶을 때 */
      child: Row(
        children: [
          ClipRRect(
            /* 모서리를 깎아야 할 경우엔 이거 */
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'asset/img/food/~',
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            /* 나머지 공간 차지 */
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Content',
                  overflow: TextOverflow.ellipsis, /* 글자가 밖으로 나갔을 때 (...) */
                  maxLines: 2,
                  style: TextStyle(
                    color: BODY_TEXT_COLOR,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  '10,000',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: PRIMARY_COLOR,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
