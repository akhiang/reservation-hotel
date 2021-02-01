part of 'package:dangau_hotel/screens/screens.dart';

class OrderedRoomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorConst.kThirdColor,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: ColorConst.kSecondaryColor.withOpacity(0.15),
                  offset: Offset(0.0, 5.0),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Column(
              children: [
                BookedRoomTile(),
                BookedRoomDetail(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
