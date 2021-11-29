class NotificationService {
  Future<String> getDeviceToken() async {
    // String token = await messaging.getToken() ?? "";
    // print('FirebaseToken: $token');
    String token = await Future.value(
        'fx6ZCF4CQT-GoxdXNG0hbJ:APA91bGwC8OMbXgA-qZg3MQjmSLYuR93Z5TM0-NnrGAcZflopN-zFKWgxiuCYHhkYUROoJbLnhIcHPTttgMp7jEFN-rNpgsnxSuZK762yj3UByWr5ESt2B53rBKHyr5li0JATM2vibEp');
    return token;
  }
}
