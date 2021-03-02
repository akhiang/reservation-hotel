part of 'package:dangau_hotel/screens/screens.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Validation {
  DateRangePickerController _datePickerController;
  DateTime _selectedDate;
  FToast fToast;
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _birthDateController = TextEditingController();

  void _registerSubmit() {
    if (_formKey.currentState.validate()) {
      // context.read<LoginCubit>().login(LoginRequest(
      //       number: _mobileNumber,
      //       password: _password,
      //     ));
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OtpScreen(),
        ),
      );
    }
  }

  void _showDateCalenderBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Wrap(
        children: [
          Container(
            padding: EdgeInsets.all(32.0),
            decoration: new BoxDecoration(
              color: ColorConst.kThirdColor,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Pilih Tanggal',
                  style: kNormalTextStyle,
                ),
                SizedBox(height: 16.0),
                _buildCalender(),
                Container(
                  width: double.infinity,
                  height: 48.0,
                  margin: EdgeInsets.all(16.0),
                  child: PrimaryButton(
                    text: 'Pilih',
                    press: () {
                      if (_selectedDate == null) {
                        _showToast();
                      } else {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                SizedBox(height: 32.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _selectedDate = args.value;
      _birthDateController.text = Helper.dateFormat(args.value);
    });

    print(_selectedDate);
  }

  @override
  void dispose() {
    _addressController.dispose();
    _mobileNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: ColorConst.kErrorColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_rounded, color: ColorConst.kThirdColor),
          SizedBox(width: 12.0),
          Text(
            'Silahkan pilih tanggal lahir',
            style: TextStyle(
              color: ColorConst.kThirdColor,
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Daftar', isLeading: true),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 104.0),
        height: 80.0,
        child: PrimaryButton(
          text: 'Lanjutkan',
          press: () {
            _registerSubmit();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectedRoomCard(
                  title: 'johndoe@gmail.com',
                ),
                SelectedRoomCard(
                  title: 'John Doe',
                ),
                InputField(
                  hint: "Alamat",
                  validation: validateAddress,
                  controller: _addressController,
                  onChanged: (value) {},
                ),
                InputField(
                  hint: "Nomor Telepon",
                  validation: validatePhoneNumberLogin,
                  controller: _mobileNumberController,
                  onChanged: (value) {},
                ),
                InputField(
                  hint: "Kata Sandi",
                  validation: validatePasswordRegister,
                  controller: _passwordController,
                  onChanged: (value) {},
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Text('Tanggal Lahir', style: kNormalBoldTextStyle),
                    SizedBox(width: 8.0),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => InfoDialog(
                            icon: Icons.info,
                            description:
                                'Anda harus berumur diatas 18 tahun untuk mendaftar',
                            buttonText: 'Oke, mengerti',
                            press: () => Navigator.of(context).pop(),
                          ),
                        );
                      },
                      child: Icon(Icons.help_outline_outlined),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                InputField(
                  tap: () {
                    _showDateCalenderBottomSheet();
                  },
                  readOnly: true,
                  hint: "Tanggal Lahir",
                  validation: validateBirthDate,
                  controller: _birthDateController,
                  suffixIcon: Icons.edit,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SfDateRangePicker _buildCalender() {
    return SfDateRangePicker(
      toggleDaySelection: true,
      onSelectionChanged: _onSelectionChanged,
      view: DateRangePickerView.year,
      initialDisplayDate: DateTime.now().subtract(Duration(days: 365 * 18)),
      maxDate: DateTime.now().subtract(Duration(days: 1)),
      controller: _datePickerController,
      selectionMode: DateRangePickerSelectionMode.single,
      headerStyle: DateRangePickerHeaderStyle(
        textAlign: TextAlign.center,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 5,
          color: ColorConst.kSecondaryColor,
        ),
      ),
      selectionTextStyle: const TextStyle(
          color: ColorConst.kSecondaryColor, fontWeight: FontWeight.w600),
      monthViewSettings: DateRangePickerMonthViewSettings(
        weekendDays: <int>[7],
        showTrailingAndLeadingDates: true,
        viewHeaderStyle: DateRangePickerViewHeaderStyle(
          textStyle: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 5,
              color: ColorConst.kSecondaryColor),
        ),
      ),
      monthCellStyle: DateRangePickerMonthCellStyle(
        weekendTextStyle: TextStyle(color: Colors.red),
        todayTextStyle: TextStyle(color: ColorConst.kSecondaryColor),
        todayCellDecoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1),
        ),
      ),
    );
  }
}
