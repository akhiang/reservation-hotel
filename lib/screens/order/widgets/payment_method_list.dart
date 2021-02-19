part of 'package:dangau_hotel/screens/screens.dart';

class PaymentMethodList extends StatefulWidget {
  @override
  _PaymentMethodListState createState() => _PaymentMethodListState();
}

class _PaymentMethodListState extends State<PaymentMethodList> {
  @override
  void initState() {
    _loadPaymentMethodList();
    super.initState();
  }

  void _loadPaymentMethodList() {
    context.read<PaymentMethodCubit>().getPaymentMethods();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentMethodCubit, PaymentMethodState>(
      listener: (context, state) {
        if (state is PaymentMethodError) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('error'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is PaymentMethodLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PaymentMethodLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.paymentMethods.length,
            itemBuilder: (_, index) {
              final PaymentMethod paymentMethod = state.paymentMethods[index];
              return RoundedIconCard(
                title: paymentMethod.name,
                trailingIcon: Icons.circle,
                press: () {
                  Navigator.pop(context, paymentMethod);
                },
              );
            },
          );
        } else {
          return Text("off");
        }
      },
    );
  }
}
