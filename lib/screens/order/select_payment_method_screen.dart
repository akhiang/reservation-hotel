part of 'package:dangau_hotel/screens/screens.dart';

class SelectPaymentMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Metode Pembayaran', isLeading: true),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PaymentMethodList(),
          ],
        ),
      ),
    );
  }
}
