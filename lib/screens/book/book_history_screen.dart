part of 'package:dangau_hotel/screens/screens.dart';

class BookHistoryScreen extends StatefulWidget {
  @override
  _BookHistoryScreenState createState() => _BookHistoryScreenState();
}

class _BookHistoryScreenState extends State<BookHistoryScreen> {
  @override
  void initState() {
    super.initState();
    _loadBookedList();
  }

  void _loadBookedList() => context.read<BookedCubit>().getBookedList();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<BookedCubit, BookedState>(
            builder: (_, state) {
              if (state is BookedLoading) {
                return BookRoomListShimmer();
              } else if (state is BookedLoaded) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.bookings.length,
                  itemBuilder: (_, index) {
                    return BookedRoomCard(
                      booking: state.bookings[index],
                    );
                  },
                );
              } else if (state is BookedError) {
                return ErrorCard(press: () {});
              } else {
                return ErrorCard(press: () {});
              }
            },
          ),
          SizedBox(height: 96.0),
        ],
      ),
    );
  }
}
