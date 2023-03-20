import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt isMenuButtonSelected = 0.obs;
  List<String> homeMenuButtonLabel = ['Recommended', 'Popular', 'Trending'];
  MaterialColor primaryColor = const MaterialColor(0xFF00BD90, {
    50: Color(0xFF00BD90),
    100: Color(0xFF00BD90),
    200: Color(0xFF00BD90),
    300: Color(0xFF00BD90),
    400: Color(0xFF00BD90),
    500: Color(0xFF00BD90),
    600: Color(0xFF00BD90),
    700: Color(0xFF00BD90),
    800: Color(0xFF00BD90),
    900: Color(0xFF00BD90)
  });
  List<Map> allHotel = [
    {
      'image': [
        'asset/images/hotel_1.png',
        'asset/images/hotel_2.png',
        'asset/images/hotel_3.png',
        'asset/images/hotel_4.png',
      ],
      'lat': 33.6046635,
      'lang': 73.1182641,
      'hotel_name': 'Shelton Hotel',
      'location': 'Pakistan',
      'rent': '800',
      'room': [
        {
          'room_name': 'Standard Double Room',
          'size': '215',
          'facilities': [
            {'image': 'asset/icon/breakfast.png', 'label': 'Breakfast include'},
            {'image': 'asset/icon/adults.png', 'label': 'Price for 2 adults'},
            {'image': 'asset/icon/bed.png', 'label': 'Large Bed',},
            {'image': 'asset/icon/size.png', 'label': 'room size'},
            {'image':  'asset/icon/breakfast.png', 'label': 'BreakFast include in the Price'},
            {'image':  'asset/icon/wifi.png', 'label': 'Free Wifi'},
            {'image':  'asset/icon/done.png', 'label': 'Air Condition'},
            {'image':  'asset/icon/done.png', 'label': 'Desk'},
            {'image':  'asset/icon/done.png', 'label': 'Free toiletries'}
          ],
          'rent': '8590',
          'booking_total_rooms': '0',
          'images': [
            'asset/images/room1.jpg',
            'asset/images/room2.jpg',
            'asset/images/room3.jpg',
            'asset/images/room4.jpg',
          ],
          'total_rooms': <String>[
            'remove',
            'Room 1',
            'Room 2',
            'Room 3',
            'Room 4',
            'Room 5'
          ],
          'selectvalue': 'Room 1',
          'isSelect': true,
        }
      ]
    },
    {
      'image': [
        'asset/images/hotel_2.png',
        'asset/images/second1.jpg',
        'asset/images/second2.jpg',
        'asset/images/second3.jpg',
        'asset/images/second4.jpg',
        'asset/images/second5.jpg',
      ],
      'lat': 33.7107318,
      'lang': 73.059595,
      'hotel_name': 'Envoy Contiental',
      'location': 'England',
      'rent': '500',
      'room': [
        {
          'room_name': 'King Room ith Garden View',
          'size': '255',
          'facilities': [ {'image': 'asset/icon/breakfast.png', 'label': 'Breakfast include'},
            {'image': 'asset/icon/adults.png', 'label': 'Price for 2 adults'},
            {'image': 'asset/icon/bed.png', 'label': 'Large Bed',},
            {'image': 'asset/icon/size.png', 'label': 'room size'},
            {'image':  'asset/icon/breakfast.png', 'label': 'BreakFast include in the Price'},
            {'image':  'asset/icon/wifi.png', 'label': 'Free Wifi'},
            {'image':  'asset/icon/done.png', 'label': 'Air Condition'},
            {'image':  'asset/icon/done.png', 'label': 'Desk'},
            {'image':  'asset/icon/done.png', 'label': 'Free toiletries'}],
          'rent': '4590',
          'booking_total_rooms': '0',
          'images': [
            'asset/images/room1.jpg',
            'asset/images/room2.jpg',
            'asset/images/room3.jpg',
            'asset/images/room4.jpg',
          ],
          'total_rooms': <String>[
            'remove',
            'Room 1',
            'Room 2',
            'Room 3',
            'Room 4',
            'Room 5',
            'Room 6',
            'Room 7'
          ],
          'selectvalue': 'Room 1',
          'isSelect': true,
        }
      ]
    },
    {
      'image': [
        'asset/images/hotel_3.png',
        'asset/images/therd1.jpg',
        'asset/images/therd2.jpg',
        'asset/images/therd3.jpg',
        'asset/images/therd4.jpg',
        'asset/images/therd5.jpg',
      ],
      'lat': 33.58859,
      'lang': 73.0562133,
      'hotel_name': 'Pearl Contiental',
      'location': 'India',
      'rent': '200',
      'room': [
        {
          'room_name': 'Deluxe Twin Room',
          'size': '215',
          'facilities':  [ {'image': 'asset/icon/breakfast.png', 'label': 'Breakfast include'},
            {'image': 'asset/icon/adults.png', 'label': 'Price for 2 adults'},
            {'image': 'asset/icon/bed.png', 'label': 'Large Bed',},
            {'image': 'asset/icon/size.png', 'label': 'room size'},
            {'image':  'asset/icon/breakfast.png', 'label': 'BreakFast include in the Price'},
            {'image':  'asset/icon/wifi.png', 'label': 'Free Wifi'},
            {'image':  'asset/icon/done.png', 'label': 'Air Condition'},
            {'image':  'asset/icon/done.png', 'label': 'Desk'},
            {'image':  'asset/icon/done.png', 'label': 'Free toiletries'}],
          'rent': '9590',
          'booking_total_rooms': '0',
          'images': [
            'asset/images/room1.jpg',
            'asset/images/room2.jpg',
            'asset/images/room3.jpg',
            'asset/images/room4.jpg',
          ],
          'total_rooms': <String>[
            'remove',
            'Room 1',
            'Room 2',
            'Room 3',
            'Room 4',
            'Room 5',
            'Room 6',
            'Room 7',
            'Room 8'
          ],
          'isSelect': true,
          'selectvalue': 'Room 1',
        }
      ]
    },
    {
      'image': [
        'asset/images/hotel_4.png',
        'asset/images/four1.png',
        'asset/images/four2.png',
        'asset/images/four3.png',
        'asset/images/four4.png',
        'asset/images/four5.png',
      ],
      'lat': 33.7328747,
      'lang': 73.0870783,
      'hotel_name': 'Marriot Hotel',
      'location': 'Lahore,Pakistan',
      'rent': '150',
      'room': [
        {
          'room_name': 'Standard Double Room',
          'size': '215',
          'facilities':  [ {'image': 'asset/icon/breakfast.png', 'label': 'Breakfast include'},
            {'image': 'asset/icon/adults.png', 'label': 'Price for 2 adults'},
            {'image': 'asset/icon/bed.png', 'label': 'Large Bed',},
            {'image': 'asset/icon/size.png', 'label': 'room size'},
            {'image':  'asset/icon/breakfast.png', 'label': 'BreakFast include in the Price'},
            {'image':  'asset/icon/wifi.png', 'label': 'Free Wifi'},
            {'image':  'asset/icon/done.png', 'label': 'Air Condition'},
            {'image':  'asset/icon/done.png', 'label': 'Desk'},
            {'image':  'asset/icon/done.png', 'label': 'Free toiletries'}],
          'rent': '5590',
          'booking_total_rooms': '0',
          'images': [
            'asset/images/room1.jpg',
            'asset/images/room2.jpg',
            'asset/images/room3.jpg',
            'asset/images/room4.jpg',
          ],
          'total_rooms': <String>['remove', 'Room 1', '1', '2', '3', '4'],
          'selectvalue': 'Room 1',
          'isSelect': true,
        }
      ]
    }
  ];
  List<Map<dynamic, dynamic>> review = [
    {
      'image': 'asset/images/human1.png',
      'name': 'Kamran',
      'comment':
          'very nice and comfortable hotel, thank you for accompanying my vacation',
      'date': 'Dec 30, 2024',
      'rating': '2'
    },
    {
      'image': 'asset/images/human2.png',
      'name': 'Faisal',
      'comment':
          'very beautiful hotel, my family and i are very satisfied with the service',
      'date': 'Dec 10, 2024',
      'rating': '3'
    },
    {
      'image': 'asset/images/human3.png',
      'name': 'Hamza',
      'comment':
          'The rooms are very comfortable and the natural views are amazing, cant wait to come back again',
      'date': 'Dec 16, 2024',
      'rating': '4'
    },
    {
      'image': 'asset/images/human4.png',
      'name': 'Tanveer',
      'comment':
          'very nice and comfortable hotel, thank you for accompanying my vacation',
      'date': 'Dec 25, 2024',
      'rating': '5'
    },
  ];
  RxInt roomImageIndex = 0.obs;
  RxInt currentHotelImage = 0.obs;
}
