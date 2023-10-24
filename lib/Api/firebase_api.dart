import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push/main.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
    // initialize further settings for push notifications
    initPushNotifications();
  }

  void handleMessage(RemoteMessage? message) {
    // nếu message = null , ko làm gì hết
    if (message == null) {
      return;
    }
    //navigate to new screen when message is received and user taps notification
    navigatorKey.currentState?.pushNamed(
      '/notification_screen',
      arguments: message,
    );
  }

  //initialize background settings
  Future initPushNotifications() async {
    //handle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    // attach event listeners for when a notification opens the App
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
