import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:dangau_hotel/services/services.dart';
import 'package:equatable/equatable.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final BookingService _bookingService;

  OrderCubit(this._bookingService) : super(OrderInitial());

  Future<void> saveOrder(OrderRequest orderRequest) async {
    // print(orderRequest);
    _bookingService.postBooking(orderRequest);
  }
}
