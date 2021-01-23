part of 'package:dangau_hotel/screens/screens.dart';

class HotelScreen2 extends StatefulWidget {
  final Hotel hotel;

  const HotelScreen2({Key key, this.hotel}) : super(key: key);

  @override
  _HotelScreen2State createState() => _HotelScreen2State();
}

class _HotelScreen2State extends State<HotelScreen2> {
  double _dragScrollSheetExtent = 0;
  double _widgetHeight = 0;
  double _position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned.fill(
              bottom: SizeConfig.screenHeight(context) * 0.3,
              child: Image.asset(
                widget.hotel.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorConst.kSecondaryColor.withOpacity(0.0),
                    ColorConst.kSecondaryColor.withOpacity(1.0)
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              child: IconButton(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 64.0,
                ),
                icon: Icon(
                  Icons.chevron_left,
                  size: 32.0,
                  color: ColorConst.kThirdColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Positioned(
              left: 20.0,
              bottom: _position,
              child: Text(
                'asdasda',
                style: TextStyle(color: ColorConst.kThirdColor),
              ),
            ),
            NotificationListener<DraggableScrollableNotification>(
              onNotification: (DraggableScrollableNotification notification) {
                setState(() {
                  _widgetHeight = context.size.height;
                  _dragScrollSheetExtent = notification.extent;
                  _position = _dragScrollSheetExtent * _widgetHeight;
                });
                return;
              },
              child: DraggableScrollableSheet(
                initialChildSize: 0.1,
                minChildSize: 0.1,
                maxChildSize: 0.8,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: ColorConst.kThirdColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: ListView.builder(
                        controller: scrollController,
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text('Item $index'),
                          );
                        }),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
