import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotifictionsScreen extends StatelessWidget {
  final RemoteMessage messages;
  const NotifictionsScreen({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاشعارات'),
      ),
      body: Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(messages.notification!.title.toString(),style: TextStyle(
            fontSize: 20.sp,
          ),),
          Text(messages.notification!.body.toString())
        ],
      ),
      ),
    );
  }
}
