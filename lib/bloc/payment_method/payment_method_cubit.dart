import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:dangau_hotel/services/services.dart';
import 'package:equatable/equatable.dart';

part 'payment_method_state.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState> {
  final PaymentMethodService _paymentMethodService;

  PaymentMethodCubit(this._paymentMethodService)
      : super(PaymentMethodInitial());

  Future<void> getPaymentMethods() async {
    emit(PaymentMethodLoading());
    try {
      final List<PaymentMethod> paymentMethods =
          await _paymentMethodService.getPaymentMethods();
      emit(PaymentMethodLoaded(paymentMethods: paymentMethods));
    } catch (e) {
      print(e.toString());
      emit(PaymentMethodError());
    }
  }
}
