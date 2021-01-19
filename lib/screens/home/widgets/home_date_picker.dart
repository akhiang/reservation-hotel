part of 'package:dangau_hotel/screens/screens.dart';

class HomeDatePicker extends StatelessWidget {
  const HomeDatePicker({
    Key key,
  }) : super(key: key);

  void _showDateBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(25.0),
            topRight: const Radius.circular(25.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDateBottomSheet(context);
      },
      child: Container(
        height: 120.0,
        width: 320.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0.0, 5.0),
              blurRadius: 20.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pilih Tanggal',
                style: TextStyle(
                  color: ColorConst.kSecondaryColor,
                  fontSize: 16.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.arrow_back_ios, color: ColorConst.kPrimaryColor),
                  Text(
                    'Desember 2020',
                    style: TextStyle(
                      color: ColorConst.kSecondaryColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,
                      color: ColorConst.kPrimaryColor),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '15 Des',
                    style: TextStyle(
                      color: ColorConst.kSecondaryColor,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    ' - ',
                    style: TextStyle(
                      color: ColorConst.kSecondaryColor,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '16 Des',
                    style: TextStyle(
                      color: ColorConst.kSecondaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
