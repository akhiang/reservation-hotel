part of 'package:dangau_hotel/screens/screens.dart';

Future<void> showOrderTimeoutDialog(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => CustomDialog(
      title: 'Waktu Pemesanan Habis',
      description: 'Anda dapat menambah waktu pemesanan kamar hotel',
      firstButtonText: 'Batal',
      firstButtonPress: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
      secondButtonText: 'Tambah Waktu',
      secondButtonPress: () {
        context.read<OrderCheckoutTimerBloc>().add(
              OrderCheckoutTimerStarted(
                duration: 900,
              ),
            );
        Navigator.of(context).pop();
      },
    ),
  );
}
