import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class BookingController extends GetxController{
  RxInt bookingButton=0.obs;
  RxInt rooms=1.obs;
  RxInt adults=2.obs;
 //  Map<String,Marker> marker={} ;
  DateTimeRange? myDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(
        Duration(days: 2),
      ));
  var start;
  var end;
  RxList<dynamic> totalChildren=[].obs;
RxString selectChildrenYears='Select Child Year'.obs;
RxList<String> totalYears= ['Select Child Year','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'].obs;
RxInt cancelPaymentButton=0.obs;
  RxInt PaymentButton=0.obs;
  RxString cardScan=''.obs;
  RxString cardImage=''.obs;
  RxDouble fullRating=0.0.obs;
RxInt ratingFilter=0.obs;
}
