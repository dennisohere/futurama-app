import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  runApp(const ProviderScope(child: MyApp()));
}


