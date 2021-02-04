part of 'package:dangau_hotel/screens/screens.dart';

class HotelReview extends StatefulWidget {
  @override
  _HotelReviewState createState() => _HotelReviewState();
}

class _HotelReviewState extends State<HotelReview>
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
      child: Column(
        children: [
          _buildRating(),
          _buildReviewBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(
              color: ColorConst.kSecondaryColor,
              thickness: 1.0,
            ),
          ),
          _buildReviewListTile(),
        ],
      ),
    );
  }

  Center _buildRating() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16.0),
          Text(
            '4.8',
            style: TextStyle(
              color: ColorConst.kSecondaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 40.0,
            ),
          ),
          SizedBox(height: 8.0),
          RatingBar.builder(
            initialRating: 5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 32.0,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          SizedBox(height: 8.0),
          Text(
            '100 Ulasan',
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

  Padding _buildReviewBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          ReviewBar(title: '5', score: 80),
          ReviewBar(title: '4', score: 15),
          ReviewBar(title: '3', score: 3),
          ReviewBar(title: '2', score: 2),
          ReviewBar(title: '1', score: 0),
        ],
      ),
    );
  }

  Column _buildReviewListTile() {
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
        SizedBox(height: 8.0),
        ReviewListTile(),
        ReviewListTile(),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildChoiceChips() {
    return Container(
      height: 56.0,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
