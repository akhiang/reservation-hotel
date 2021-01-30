part of 'package:dangau_hotel/screens/screens.dart';

class OrderPriceDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: ColorConst.kThirdColor,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [kShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('15 - 18 Desember 2020', style: kNormalBoldTextStyle),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Deluxe Twin, with Balcony', style: kNormalBoldTextStyle),
              Icon(Icons.info, color: ColorConst.kSecondaryColor)
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Jumlah kamar', style: kNormalTextStyle),
              Text('2', style: kNormalBoldTextStyle),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Lama waktu inap', style: kNormalTextStyle),
              Text('3 Malam', style: kNormalBoldTextStyle),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Harga/malam', style: kNormalTextStyle),
              Text('Rp700000', style: kNormalBoldTextStyle),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sub-Total', style: kNormalTextStyle),
              Text('Rp4200000', style: kNormalBoldTextStyle),
            ],
          ),
          SizedBox(height: 16.0),
          Divider(
            color: ColorConst.kSecondaryColor.withOpacity(0.5),
            thickness: 1.0,
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: kNormalTextStyle),
              Text('Rp4200000', style: kNormalBoldTextStyle),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('PPN', style: kNormalTextStyle),
              Text('Rp420000', style: kNormalBoldTextStyle),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Grand Total', style: kNormalTextStyle),
              Text('Rp4620000', style: kNormalBoldTextStyle),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Bayar Sekarang', style: kNormalBoldTextStyle),
              Text('Rp 1617000', style: kNormalBoldTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
