part of 'package:dangau_hotel/screens/screens.dart';

class OrderRoomSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSelectedRoom(),
          // _buildAddMoreRoom(),
          _buildPriceDetail(context),
          SizedBox(height: 88.0),
        ],
      ),
    );
  }

  // Widget _buildAddMoreRoom() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 24.0),
  //     width: double.infinity,
  //     height: 56.0,
  //     child: ShadowButton(
  //       icon: Icons.add,
  //       text: 'Tambah Kamar',
  //       press: () {},
  //     ),
  //   );
  // }

  Widget _buildSelectedRoom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pilihan Kamar', style: kNormalTextStyle),
          BlocBuilder<RoomCartCubit, RoomCartState>(
            builder: (_, state) {
              final selectedRooms = (state as RoomCartLoaded).selectedRoomCart;
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: selectedRooms.length,
                itemBuilder: (_, index) {
                  final selectedRoom = selectedRooms[index];
                  return SelectedRoomCard(
                    title: '${selectedRoom.room.name}'.titleCase,
                    subtitle: '${selectedRoom.room.variant}'.titleCase,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPriceDetail(BuildContext context) {
    DateState dateState = context.watch<DateCubit>().state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Detail Harga', style: kNormalTextStyle),
          SizedBox(height: 16.0),
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: ColorConst.kThirdColor,
              borderRadius: BorderRadius.circular(24.0),
              boxShadow: [kShadow],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    DateFormat('dd MMM yyyy').format(dateState.rangeStartDate) +
                        ' - ' +
                        DateFormat('dd MMM yyyy')
                            .format(dateState.rangeEndDate),
                    style: kNormalBoldTextStyle),
                SizedBox(height: 8.0),
                BlocBuilder<RoomCartCubit, RoomCartState>(
                  builder: (_, state) {
                    final selectedRooms =
                        (state as RoomCartLoaded).selectedRoomCart;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: selectedRooms.length,
                      itemBuilder: (_, index) {
                        return OrderRoomDetail(
                            selectedRoom: selectedRooms[index]);
                      },
                    );
                  },
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
          ),
        ],
      ),
    );
  }
}
