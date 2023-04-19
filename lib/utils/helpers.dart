import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../services/navigation_service.dart';



BuildContext? getBuildContext() => NavigationService().navigatorKey.currentContext;


Logger logger() => Logger();

