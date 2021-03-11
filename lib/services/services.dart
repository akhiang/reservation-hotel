import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:dangau_hotel/env.dart';
import 'package:dangau_hotel/exceptions/app_exception.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:http/http.dart' as http;

part 'package:dangau_hotel/services/api_service.dart';
part 'package:dangau_hotel/services/auth_service.dart';
part 'package:dangau_hotel/services/booked_service.dart';
part 'package:dangau_hotel/services/booking_service.dart';
part 'package:dangau_hotel/services/hotel_service.dart';
part 'package:dangau_hotel/services/room_service.dart';
part 'package:dangau_hotel/services/payment_method_service.dart';
