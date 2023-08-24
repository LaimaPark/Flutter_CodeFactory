import 'package:actual/common/const/data.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:actual/restaurant/model/restaurant_model.dart';
import 'package:actual/restaurant/view/restaurant_detail_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  /* Future return -> async */
  Future<List> paginateRestaurant() async {
    final dio = Dio();

    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await dio.get('http://$ip/restaurant',
        options: Options(headers: {'authorization': 'Bearer $accessToken'}));

    /* API response 에서 필요한게 data */
    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FutureBuilder<List>(
              future: paginateRestaurant(), /* data 요청하는 곳 */
              builder: (context, AsyncSnapshot<List> snapshot) {
                if (!snapshot.hasData) {
                  /* Data 가 없으면?? */
                  return Container();
                }

                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    /* item 실행할때마다 생성댐 */
                    final item = snapshot.data![index];
                    final pItem = RestaurantModel.fromJson(json: item);
                    // return RestaurantCard.fromModel(model: pItem);
                    /* Factory 만들어서 씀 */

                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => RestaurantDetailScreen(),
                          ),
                        );
                      },
                      child: RestaurantCard.fromModel(
                          model: pItem
                      )
                    );


                    /* pItem -> pItem2 변경 */
                    /* model 에서 mapping 을 해줌으로써 더 간결해짐 */

                    // final pItem = RestaurantModel(
                    //     id: item['id'],
                    //     name: item['name'],
                    //     thumbUrl: 'http://$ip${item['thumbUrl']}',
                    //     tags: List<String>.of(item['tags']),
                    //     /* value 들을 하나씩 찾으면서 같은 값이 있는치 찾는 것 */
                    //     priceRange: RestaurantPriceRange.values
                    //         .firstWhere((e) => e.name == item['priceRange']),
                    //     ratings: item['ratings'],
                    //     ratingsCount: item['ratingsCount'],
                    //     deliveryTime: item['deliveryTime'],
                    //     deliveryFee: item['deliveryFee']
                    // );

                  },
                  separatorBuilder: (_, index) {
                    /* 각 item 사이에 들어가는 공백이라고 보면 댐 */
                    return SizedBox(
                      height: 16.0,
                    );
                  },
                );
              },
            )));
  }
}
