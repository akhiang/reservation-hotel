import 'dart:async';
import 'dart:io';

import 'package:shimmer/shimmer.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:dangau_hotel/widgets/widgets.dart';
import 'package:dangau_hotel/utils/utils.dart';
import 'package:dangau_hotel/bloc/bloc.dart';

part 'package:dangau_hotel/screens/onboarding/onboarding_screen.dart';
part 'package:dangau_hotel/screens/onboarding/splash_screen.dart';

part 'package:dangau_hotel/screens/auth/login_screen.dart';
part 'package:dangau_hotel/screens/auth/register_screen.dart';
part 'package:dangau_hotel/screens/auth/otp_screen.dart';
part 'package:dangau_hotel/screens/auth/widgets/login_form.dart';
part 'package:dangau_hotel/screens/auth/widgets/social_media_login_card.dart';
part 'package:dangau_hotel/screens/auth/widgets/otp_input_field.dart';
part 'package:dangau_hotel/screens/auth/widgets/onboarding_content.dart';

part 'package:dangau_hotel/screens/home/home_screen.dart';
// part 'package:dangau_hotel/screens/home/find_hotel_screen.dart';
part 'package:dangau_hotel/screens/home/widgets/home_carousel.dart';
part 'package:dangau_hotel/screens/home/widgets/home_header.dart';
// part 'package:dangau_hotel/screens/home/widgets/home_date_picker.dart';
part 'package:dangau_hotel/screens/home/widgets/hotel_list.dart';
part 'package:dangau_hotel/screens/home/widgets/hotel_list_card.dart';
part 'package:dangau_hotel/screens/home/widgets/hotel_list_shimmer.dart';

part 'package:dangau_hotel/screens/hotel/hotel_screen.dart';
part 'package:dangau_hotel/screens/hotel/hotel_information.dart';
part 'package:dangau_hotel/screens/hotel/hotel_food.dart';
part 'package:dangau_hotel/screens/hotel/hotel_review_tab.dart';
part 'package:dangau_hotel/screens/hotel/widgets/hotel_contact_list_tile.dart';
part 'package:dangau_hotel/screens/hotel/widgets/facility_card.dart';
part 'package:dangau_hotel/screens/hotel/widgets/food_card.dart';
part 'package:dangau_hotel/screens/hotel/widgets/other_food_card.dart';
part 'package:dangau_hotel/screens/hotel/widgets/review_bar.dart';
part 'package:dangau_hotel/screens/hotel/widgets/review_list_tile.dart';
part 'package:dangau_hotel/screens/hotel/widgets/summary_room_list_tile.dart';
part 'package:dangau_hotel/screens/hotel/widgets/hotel_information_shimmer.dart';
part 'package:dangau_hotel/screens/hotel/widgets/hotel_food_shimmer.dart';
part 'package:dangau_hotel/screens/hotel/widgets/hotel_review_shimmer.dart';

part 'package:dangau_hotel/screens/room/room_screen.dart';
part 'package:dangau_hotel/screens/room/select_room_screen.dart';
part 'package:dangau_hotel/screens/room/room_preference_screen.dart';
part 'package:dangau_hotel/screens/room/widgets/room_shimmer.dart';
part 'package:dangau_hotel/screens/room/widgets/room_list.dart';
part 'package:dangau_hotel/screens/room/widgets/room_list_shimmer.dart';
part 'package:dangau_hotel/screens/room/widgets/room_card.dart';

part 'package:dangau_hotel/screens/order/order_screen.dart';
part 'package:dangau_hotel/screens/order/order_room_summary.dart';
part 'package:dangau_hotel/screens/order/order_customer_contact.dart';
part 'package:dangau_hotel/screens/order/order_term.dart';
part 'package:dangau_hotel/screens/order/order_payment_screen.dart';
part 'package:dangau_hotel/screens/order/select_payment_method_screen.dart';
part 'package:dangau_hotel/screens/order/order_success_screen.dart';
part 'package:dangau_hotel/screens/order/widgets/selected_room_card.dart';
part 'package:dangau_hotel/screens/order/widgets/order_room_detail.dart';
part 'package:dangau_hotel/screens/order/widgets/order_term_tile.dart';
part 'package:dangau_hotel/screens/order/widgets/virtual_account_card.dart';
part 'package:dangau_hotel/screens/order/widgets/ordered_room_card.dart';
part 'package:dangau_hotel/screens/order/widgets/order_timeout_dialog.dart';
part 'package:dangau_hotel/screens/order/widgets/payment_method_list.dart';

part 'package:dangau_hotel/screens/book/book_screen.dart';
part 'package:dangau_hotel/screens/book/book_incoming_screen.dart';
part 'package:dangau_hotel/screens/book/book_history_screen.dart';
part 'package:dangau_hotel/screens/book/book_room_detail_screen.dart';
part 'package:dangau_hotel/screens/book/widgets/book_room_list_shimmer.dart';
part 'package:dangau_hotel/screens/book/widgets/book_room_detail_shimmer.dart';
part 'package:dangau_hotel/screens/book/widgets/booked_room_card.dart';
part 'package:dangau_hotel/screens/book/widgets/booked_room_tile.dart';
part 'package:dangau_hotel/screens/book/widgets/booked_room_detail.dart';

part 'package:dangau_hotel/screens/profile/profile_screen.dart';
part 'package:dangau_hotel/screens/profile/edit_profile_screen.dart';
part 'package:dangau_hotel/screens/profile/help_screen.dart';
part 'package:dangau_hotel/screens/profile/help_refund_screen.dart';
part 'package:dangau_hotel/screens/profile/ktp_verification_screen.dart';
part 'package:dangau_hotel/screens/profile/widgets/profile_list_tile.dart';

part 'package:dangau_hotel/screens/main_screen.dart';
part 'package:dangau_hotel/screens/main_screen_2.dart';
part 'package:dangau_hotel/screens/main_screen_3.dart';
part 'package:dangau_hotel/screens/tab_item.dart';
part 'package:dangau_hotel/screens/bottom_navigation.dart';
