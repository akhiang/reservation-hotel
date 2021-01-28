part of 'package:dangau_hotel/screens/screens.dart';

enum SmokeOption { smoking, nonsmoking }

class RadioButton extends StatefulWidget {
  final String title;

  const RadioButton({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  SmokeOption _character = SmokeOption.nonsmoking;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _character = SmokeOption.smoking;
          });
          print(_character);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          decoration: BoxDecoration(
            color: ColorConst.kThirdColor,
            borderRadius: BorderRadius.circular(32.0),
            boxShadow: [
              BoxShadow(
                color: ColorConst.kSecondaryColor.withOpacity(0.15),
                offset: Offset(0.0, 5.0),
                blurRadius: 20.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title),
              SizedBox(
                width: 20.0,
                height: 20.0,
                child: Radio(
                  value: SmokeOption.smoking,
                  groupValue: _character,
                  onChanged: (SmokeOption value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
