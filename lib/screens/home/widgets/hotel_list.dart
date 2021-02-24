part of 'package:dangau_hotel/screens/screens.dart';

class HotelList extends StatefulWidget {
  const HotelList({
    Key key,
  }) : super(key: key);

  @override
  _HotelListState createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  @override
  void initState() {
    super.initState();
    _loadHotelList();
  }

  void _loadHotelList() {
    context.read<HotelBloc>().add(GetHotels());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16.0),
          height: 160.0,
          child: BlocBuilder<HotelBloc, HotelState>(
            builder: (context, state) {
              if (state is HotelLoading) {
                return HotelListShimmer();
              } else if (state is HotelLoaded) {
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.hotels.length,
                  itemBuilder: (_, index) {
                    return HotelListCard(hotel: state.hotels[index]);
                  },
                );
              } else if (state is HotelError) {
                return ErrorCard(
                  press: () {
                    _loadHotelList();
                  },
                );
              } else {
                return ErrorCard(
                  press: () {
                    _loadHotelList();
                  },
                );
              }
            },
          ),
        )
      ],
    );
  }
}
