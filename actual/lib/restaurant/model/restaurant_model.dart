import '../../common/const/data.dart';

enum RestaurantPriceRange {
  /* 몇개 선택지가 없는 경우 Enum 활용 */
  expensive,
  medium,
  cheap
}

class RestaurantModel {
  final String id;
  final String name;
  final String thumbUrl;
  final List<String> tags;
  final RestaurantPriceRange priceRange;
  final double ratings;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.tags,
    required this.priceRange,
    required this.ratings,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee
  });

  /* Factory Constructor */
  factory RestaurantModel.fromJson({
    /* String - dynamic 으로 json 표현함 */
    required Map<String, dynamic> json
  }) {
    /* Mapping */
    return RestaurantModel(
        id: json['id'],
        name: json['name'],
        thumbUrl: 'http://$ip${json['thumbUrl']}',
        tags: List<String>.of(json['tags']),
        /* value 들을 하나씩 찾으면서 같은 값이 있는치 찾는 것 */
        priceRange: RestaurantPriceRange.values
            .firstWhere((e) => e.name == json['priceRange']),
        ratings: json['ratings'],
        ratingsCount: json['ratingsCount'],
        deliveryTime: json['deliveryTime'],
        deliveryFee: json['deliveryFee']
    );
  }


}