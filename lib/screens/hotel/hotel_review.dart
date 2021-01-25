part of 'package:dangau_hotel/screens/screens.dart';

class HotelReview extends StatefulWidget {
  @override
  _HotelReviewState createState() => _HotelReviewState();
}

class _HotelReviewState extends State<HotelReview> {
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
          ),
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
        Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Anne Abigail",
                              style: TextStyle(
                                color: ColorConst.kSecondaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              "01-12-2020, 10:00 WIB",
                              style: TextStyle(
                                color:
                                    ColorConst.kSecondaryColor.withOpacity(0.5),
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        Text('⭐⭐⭐⭐⭐'),
                      ],
                    ),
                    Container(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae dignissim tristique elementum orci, lobortis. ",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          color: ColorConst.kSecondaryColor,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _buildChoiceChips() {
    return Container(
      height: 48.0,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: _choices.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              padding: EdgeInsets.all(12.0),
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
