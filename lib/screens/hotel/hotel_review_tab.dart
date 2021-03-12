part of 'package:dangau_hotel/screens/screens.dart';

class HotelReviewTab extends StatefulWidget {
  @override
  _HotelReviewStateTab createState() => _HotelReviewStateTab();
}

class _HotelReviewStateTab extends State<HotelReviewTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<String> _choices = [
    "Semua",
    "5",
    "4",
    "3",
    "2",
    "1",
  ];
  int _choiceIndex = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: BlocBuilder<HotelDetailBloc, HotelDetailState>(
        builder: (_, state) {
          if (state is HotelDetailLoading) {
            return HotelReviewShimmer();
          } else if (state is HotelDetailLoaded) {
            return Column(
              children: [
                _buildRating(state.hotel),
                _buildReviewBar(state.hotel.hotelRating),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Divider(
                    color: ColorConst.kSecondaryColor,
                    thickness: 1.0,
                  ),
                ),
                _buildReviewListTile(),
              ],
            );
          } else {
            return ErrorCard(press: () {});
          }
        },
      ),
    );
  }

  Widget _buildRating(Hotel hotel) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16.0),
          Text(
            hotel.hotelRating.rating == 0.0
                ? '0'
                : '${hotel.hotelRating.rating}',
            style: TextStyle(
              color: ColorConst.kSecondaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 40.0,
            ),
          ),
          SizedBox(height: 8.0),
          RatingBarIndicator(
            rating: hotel.hotelRating.rating.toDouble(),
            itemCount: 5,
            itemSize: 32.0,
            itemBuilder: (context, _) =>
                Icon(Icons.star, color: ColorConst.kPrimaryColor),
          ),
          SizedBox(height: 16.0),
          Text(
            '${hotel.hotelRating.ratingAmount} Ulasan',
            style: TextStyle(
              color: ColorConst.kSecondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildReviewBar(HotelRating hotelRating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          ReviewBar(title: '5', score: hotelRating.rate5),
          ReviewBar(title: '4', score: hotelRating.rate4),
          ReviewBar(title: '3', score: hotelRating.rate3),
          ReviewBar(title: '2', score: hotelRating.rate2),
          ReviewBar(title: '1', score: hotelRating.rate1),
        ],
      ),
    );
  }

  Widget _buildReviewListTile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: Text(
            "Filter",
            style: TextStyle(
              color: ColorConst.kSecondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              letterSpacing: 1.2,
            ),
          ),
        ),
        _buildChoiceChips(),
        BlocBuilder<HotelDetailBloc, HotelDetailState>(builder: (_, state) {
          if (state is HotelDetailLoading) {
            return HotelFoodShimmer();
          } else if (state is HotelDetailLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.hotel.reviews.length,
              itemBuilder: (context, index) {
                if (state.hotel.reviews[index].isPublish) {
                  return ReviewListTile(
                    review: state.hotel.reviews[index],
                  );
                }
                return SizedBox();
              },
            );
          } else {
            return ErrorCard(press: () {});
          }
        }),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildChoiceChips() {
    return Container(
      height: 56.0,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: _choices.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              padding: EdgeInsets.all(8.0),
              avatar: index == 0
                  ? null
                  : Icon(Icons.star,
                      size: 16.0,
                      color: _choiceIndex == index
                          ? ColorConst.kThirdColor
                          : ColorConst.kSecondaryColor),
              label: Text(_choices[index]),
              selected: _choiceIndex == index,
              selectedColor: ColorConst.kSecondaryColor,
              backgroundColor: Color(0xFFCBCFD8),
              labelStyle: TextStyle(
                color: _choiceIndex == index
                    ? ColorConst.kThirdColor
                    : ColorConst.kSecondaryColor,
              ),
              onSelected: (bool selected) {
                setState(() {
                  _choiceIndex = selected ? index : 0;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
