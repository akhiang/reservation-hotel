part of 'package:dangau_hotel/screens/screens.dart';

class KtpVerificationScreen extends StatefulWidget {
  static const String routeName = "ktp_verification_screen";

  @override
  _KtpVerificationScreenState createState() => _KtpVerificationScreenState();
}

class _KtpVerificationScreenState extends State<KtpVerificationScreen> {
  File _image;

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Gallery'),
                    onTap: () async {
                      var image = await imgFromGallery();
                      setState(() {
                        _image = image;
                      });
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () async {
                    var image = await imgFromCamera();
                    setState(() {
                      _image = image;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Verifikasi KTP', isLeading: true),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 104.0),
        height: 80.0,
        child: PrimaryButton(
          text: 'Verifikasi',
          press: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Upload Foto KTP Anda', style: kLargeBoldTextStyle),
              SizedBox(height: 16.0),
              _buildPhoto(context),
              SizedBox(height: 24.0),
              _buildTerm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTerm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Syarat & Ketentuan Upload KTP', style: kLargeBoldTextStyle),
        SizedBox(height: 16.0),
        OrderTermTile(title: 'Lorem Ipsum'),
        OrderTermTile(title: 'Lorem Ipsum'),
        OrderTermTile(title: 'Lorem Ipsum'),
        OrderTermTile(title: 'Lorem Ipsum'),
      ],
    );
  }

  Widget _buildPhoto(BuildContext context) {
    return InkWell(
      onTap: () {
        _showPicker(context);
      },
      child: _image == null
          ? Container(
              height: SizeConfig.screenHeight(context) * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConst.kSecondaryColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image,
                    size: 40.0,
                    color: ColorConst.kSecondaryColor.withOpacity(0.2),
                  ),
                  SizedBox(height: 16.0),
                  Text('Pilih Foto', style: kNormalTextStyle),
                ],
              ),
            )
          : Image.file(
              _image,
              scale: 2.0,
              fit: BoxFit.contain,
            ),
    );
  }
}
