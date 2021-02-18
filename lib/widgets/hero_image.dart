part of 'package:dangau_hotel/widgets/widgets.dart';

class HeroImage extends StatelessWidget {
  final double height;
  final String imageUrl;

  const HeroImage({
    Key key,
    this.height = 0.40,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: ImageClipper(),
          child: Container(
            height: SizeConfig.screenHeight(context) * (height + 0.01),
            color: ColorConst.kPrimaryColor.withOpacity(0.2),
          ),
        ),
        ClipPath(
          clipper: ImageClipper(),
          child: Container(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: SizeConfig.screenHeight(context) * height,
            ),
          ),
        ),
      ],
    );
  }
}
