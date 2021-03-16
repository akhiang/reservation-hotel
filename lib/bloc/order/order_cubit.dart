import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:dangau_hotel/services/services.dart';
import 'package:equatable/equatable.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final BookingService _bookingService;

  OrderCubit(this._bookingService) : super(OrderInitial());

  Future<void> saveOrder(OrderRequest orderRequest) async {
    emit(OrderLoading());
    await Future.delayed(Duration(seconds: 1));
    try {
      ApiResponse<OrderResponse> orderResponse =
          await _bookingService.postBooking(orderRequest);
      print(orderResponse);
      emit(OrderSuccess(orderResponse: orderResponse.data));
    } catch (error) {
      print('save order' + error.toString());
      emit(OrderError());
    }
  }
}
