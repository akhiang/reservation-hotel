part of 'package:dangau_hotel/widgets/widgets.dart';

class LoadingIndicator extends StatelessWidget {
  Future<bool> _onBackButton() {
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Container(
        color: Colors.black.withOpacity(.5),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      onWillPop: _onBackButton,
    );
  }
}
