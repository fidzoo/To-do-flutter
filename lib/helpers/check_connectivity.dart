import 'package:connectivity/connectivity.dart';
import 'package:first_list_app/components/simple_alert_box.dart';

checkConnectivity(context) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.none) {
    // not connected to any.
    showSimpleAlertBox('لا يوجد اتصال',
        'لا يوجد أي اتصال بالانترنت برجاء التحقق من اتصالك', context);
  } else if (connectivityResult == ConnectivityResult.mobile) {
    // connected to a mobile network.
    showSimpleAlertBox('تنبيه', 'أنت تستخدم انترنت شبكة الجوال', context);
  } else if (connectivityResult == ConnectivityResult.wifi) {
    // connected to a wifi network.
  }
}
