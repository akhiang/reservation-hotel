part of 'package:dangau_hotel/screens/screens.dart';

enum SmokingOption { smoking, nonSmoking }
enum BedOption { singleBed, twinBed }

class RoomPreferenceScreen extends StatefulWidget {
  final RoomCart roomCart;

  const RoomPreferenceScreen({Key key, @required this.roomCart})
      : super(key: key);

  @override
  _RoomPreferenceScreenState createState() => _RoomPreferenceScreenState();
}

class _RoomPreferenceScreenState extends State<RoomPreferenceScreen> {
  bool isNote = false;
  String note = '';
  SmokingOption smokeOption = SmokingOption.smoking;
  BedOption bedOption = BedOption.singleBed;

  RoomPreference roomPreference = RoomPreference(
    isSmoke: true,
    isSingleBed: true,
    note: '',
  );

  @override
  void initState() {
    super.initState();
    smokeOption = widget.roomCart.roomPreference.isSmoke
        ? SmokingOption.smoking
        : SmokingOption.nonSmoking;

    bedOption = widget.roomCart.roomPreference.isSingleBed
        ? BedOption.singleBed
        : BedOption.twinBed;

    isNote = widget.roomCart.roomPreference.note != '' ? true : false;
    note = widget.roomCart.roomPreference.note;

    roomPreference.isSmoke = widget.roomCart.roomPreference.isSmoke;
    roomPreference.isSingleBed = widget.roomCart.roomPreference.isSingleBed;
    roomPreference.note = widget.roomCart.roomPreference.note;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Preferensi Kamar', isLeading: true),
      ),
      bottomNavigationBar: Container(
        height: 64.0,
        color: Colors.transparent,
        child: Center(
          child: SizedBox(
            height: 40.0,
            width: 120.0,
            child: PrimaryButton(
              text: 'Simpan',
              press: () {
                print(roomPreference);
                // context
                //     .read<RoomCartCubit>()
                //     .updateRoomCart(widget.roomCart, roomPreference);
                // Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 24.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${widget.roomCart.room.name}'.titleCase,
                        style: TextStyle(
                          color: ColorConst.kSecondaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      TextSpan(
                        text: ', ${widget.roomCart.room.variant}',
                        style: TextStyle(
                          color: ColorConst.kSecondaryColor,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildSmokeRadioButton(),
              _buildBedRadioButton(),
              SizedBox(height: 8.0),
              isNote
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: RoundedTextArea(
                        line: 4,
                        hint: "Catatan",
                        value: note,
                        onChanged: (value) {
                          setState(() {
                            roomPreference.note = value;
                          });
                        },
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      width: double.infinity,
                      height: 52.0,
                      child: ShadowButton(
                        icon: Icons.add,
                        text: 'Tambah Catatan',
                        press: () {
                          setState(() {
                            isNote = true;
                          });
                        },
                      ),
                    ),
              // SizedBox(height: 88.0),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildSmokeRadioButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            decoration: BoxDecoration(
              color: ColorConst.kThirdColor,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: ColorConst.kSecondaryColor.withOpacity(0.15),
                  offset: Offset(0.0, 5.0),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Column(
              children: [
                RadioButton(
                  title: 'Smoking',
                  icon: Icons.smoking_rooms,
                  value: smokeOption,
                  radioValue: SmokingOption.smoking,
                  tap: () {
                    setState(() {
                      smokeOption = SmokingOption.smoking;
                      roomPreference.isSmoke = true;
                    });
                  },
                  change: (value) {
                    print(value);
                    setState(() {
                      smokeOption = value;
                      roomPreference.isSmoke = true;
                    });
                  },
                ),
                RadioButton(
                  title: 'Non-Smoking',
                  icon: Icons.smoke_free,
                  value: smokeOption,
                  radioValue: SmokingOption.nonSmoking,
                  tap: () {
                    setState(() {
                      smokeOption = SmokingOption.nonSmoking;
                      roomPreference.isSmoke = false;
                    });
                  },
                  change: (value) {
                    setState(() {
                      smokeOption = value;
                      roomPreference.isSmoke = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildBedRadioButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            decoration: BoxDecoration(
              color: ColorConst.kThirdColor,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: ColorConst.kSecondaryColor.withOpacity(0.15),
                  offset: Offset(0.0, 5.0),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Column(
              children: [
                RadioButton(
                  title: 'Single Bed',
                  icon: Icons.single_bed_rounded,
                  value: bedOption,
                  radioValue: BedOption.singleBed,
                  tap: () {
                    setState(() {
                      bedOption = BedOption.singleBed;
                      roomPreference.isSingleBed = true;
                    });
                  },
                  change: (value) {
                    setState(() {
                      bedOption = value;
                      roomPreference.isSingleBed = true;
                    });
                  },
                ),
                RadioButton(
                  title: 'Twin Bed',
                  icon: Icons.king_bed_rounded,
                  value: bedOption,
                  radioValue: BedOption.twinBed,
                  tap: () {
                    setState(() {
                      bedOption = BedOption.twinBed;
                      roomPreference.isSingleBed = false;
                    });
                  },
                  change: (value) {
                    setState(() {
                      bedOption = value;
                      roomPreference.isSingleBed = false;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
