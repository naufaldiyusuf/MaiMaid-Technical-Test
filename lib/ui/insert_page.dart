part of 'pages.dart';

class InsertPage extends StatefulWidget {

  @override
  _InsertPageState createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {

  bool isLoading = false;
  bool pageForDetail = true;
  String title = "Detail User";
  TextEditingController fullName = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  TextEditingController dob = TextEditingController();
  int genderId = 1;
  bool checkBox = false;

  @override
  void initState() {
    super.initState();
    gender.text = "Pria";
    dob.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
            onWillPop: () async {
              context.read<PageBloc>().add(GoToListPage());
              return false;
            },
            child: BlocListener<InsertBloc, InsertState>(
                listener: (_, state) {
                  if (state is InsertLoading) {
                    isLoading = true;
                    setState(() {});
                  }

                  if (state is InsertSuccess) {
                    Flushbar(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        titleText: Text("Sukses", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                        messageText: Text("Insert data berhasil", style: TextStyle(color: Colors.white, fontSize: 16)),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.red,
                        flushbarPosition: FlushbarPosition.TOP
                    );
                    context.read<PageBloc>().add(GoToListPage());
                    isLoading = false;
                    setState(() {});
                  }

                  if (state is InsertFailed) {
                    Flushbar(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        titleText: Text("Gagal", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                        messageText: Text(state.message, style: TextStyle(color: Colors.white, fontSize: 16)),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.red,
                        flushbarPosition: FlushbarPosition.TOP
                    );
                    isLoading = false;
                    setState(() {});
                  }
                },
                child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                        child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: IconButton(
                                      icon: Icon(Icons.arrow_back, color: Colors.black),
                                      onPressed: () => context.read<PageBloc>().add(GoToListPage())
                                  )
                              ),
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                                      child: Text("Insert Data")
                                  )
                              ),
                            ]
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05),
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: isLoading
                              ? Container(
                              child: SpinKitFadingCircle(color: Colors.black)
                          )
                              : ListView(
                              padding: EdgeInsets.only(top: 25),
                              children: [
                                Text("Nama Panjang"),
                                TextField(
                                  controller: fullName,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text("Email")
                                ),
                                TextField(
                                  controller: email,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text("Jenis Kelamin")
                                ),
                                TextField(
                                  controller: gender,
                                  onTap: () => getGender(),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text("Tanggal Lahir")
                                ),
                                TextField(
                                  controller: dob,
                                  onTap: () => pickDob(context),
                                ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("Password")
                                  ),
                                TextField(
                                  controller: password,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text("Konfirmasi Password")
                                ),
                                TextField(
                                  controller: passwordConfirm,
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child: Row(
                                        children: [
                                          Checkbox(
                                              value: checkBox,
                                              onChanged: (value) {
                                                checkBox = value!;
                                                setState(() {});
                                              }),
                                          Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text("Saya setuju mengupdate data ini")
                                          )
                                        ]
                                    )
                                )
                              ]
                          )
                      ),
                      GestureDetector(
                          onTap: () {
                            insertData();
                          },
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.075,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.1, top: MediaQuery.of(context).size.height * 0.05),
                              color: Colors.blue,
                              alignment: Alignment.center,
                              child: Text("Submit")
                          )

                      )
                    ]
                )
            )
        )
    );
  }

  void getGender() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        builder: (context) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text("Pria"),
                      onTap: () {
                        genderId = 1;
                        gender.text = "Pria";
                        Navigator.pop(context);
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Wanita"),
                      onTap: () {
                        genderId = 2;
                        gender.text = "Wanita";
                        Navigator.pop(context);
                      },
                    ),
                  ]
              )
          );
        }
    );
  }

  void errorDialog(String body) {
    Widget okButton = TextButton(
      child: Text("ok"),
      onPressed: () => Navigator.pop(context),
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text("Gagal"),
            content: Text(body),
            actions: [
              okButton
            ]
        );
      },
    );
  }

  void pickDob(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: DateTime.now(),firstDate: DateTime(2015, 8), lastDate: DateTime(2101));

    if (picked != null) {
      setState(() {
        dob.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void insertData() {
    if (!checkBox) {
      errorDialog("Persetujuan checkbox harus dicentang");
    } else {
      if (fullName.text.isEmpty) {
        errorDialog("Field Nama Panjang tidak boleh kosong");
      } else if (fullName.text.length < 3) {
        errorDialog("Field Nama Panjang tidak boleh kurang dari 3 huruf");
      } else if (email.text.isEmpty) {
        errorDialog("Field Email tidak boleh kosong");
      } else if (!EmailValidator.validate(email.text)) {
        errorDialog("Field Email harus berformat email (ex: tes@gmail.com)");
      } else if (password.text.isEmpty) {
        errorDialog("Field Password tidak boleh kosong");
      } else if (password.text.length < 6) {
        errorDialog("Field Password tidak boleh kurang dari 6 karakter");
      }else if (password.text != passwordConfirm.text) {
        errorDialog("Field Password harus sama degan Field Konfirmasi Password");
      } else if (!password.text.contains(new RegExp(r'[A-Z]')) && !password.text.contains(new RegExp(r'[0-9]'))) {
        errorDialog("Field Password harus mengandung kombinasi huruf dan angka");
      } else {
        context.read<InsertBloc>().add(InsertData(
            fullName.text,
            email.text,
            md5.convert(utf8.encode(password.text)).toString(),
            genderId,
            dob.text
        ));
      }
    }
  }
}
