import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:project_flutter/notification/notification_api.dart';

Future<void> createNotificationSTP() async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
    id: createUniqueId(),
    channelKey: 'basic_channel',
    title: 'Simple Notification',
    body: 'Simple body',
  ));
}

Future<void> createReminderNotification(
    DateTime notificaionSchedule, String title, String commentaire) async {
  print(notificaionSchedule);
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'scheduled_channel',
        title: title,
        body: commentaire,
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'Mark_DONE',
          label: 'Mark Done',
        ),
      ],
      schedule: NotificationCalendar(
        year: notificaionSchedule.year,
        month: notificaionSchedule.month,
        day: notificaionSchedule.day,
        hour: notificaionSchedule.hour,
        minute: notificaionSchedule.minute,
        second: 0,
        millisecond: 0,
        repeats: true,
      ));
}

Future<void> cancelScheduledNotifications() async {
  await AwesomeNotifications().cancelAllSchedules();
}
