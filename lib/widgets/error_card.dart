part of 'package:dangau_hotel/widgets/widgets.dart';

class ErrorCard extends StatelessWidget {
  final Function press;

  const ErrorCard({
    Key key,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: ColorConst.kThirdColor,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [kShadow],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Maaf, terjadi kesalahan', style: kLargeBoldTextStyle),
            SizedBox(height: 8.0),
            PrimaryButton(
              text: 'Muat Ulang',
              press: press,
              radius: 8.0,
            )
          ],
        ),
      ),
    );
  }
}
