part of 'pages.dart';

class ViewUpdatePage extends StatefulWidget {
  final int id;

  ViewUpdatePage(this.id);

  @override
  _ViewUpdatePageState createState() => _ViewUpdatePageState();
}

class _ViewUpdatePageState extends State<ViewUpdatePage> {
  ViewResponseData? data;
  bool isLoading = true;
  bool pageForDetail = true;
  String title = "Detail User";
  TextEditingController fullName = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  TextEditingController dob = TextEditingController();
  int? genderId;
  bool checkBox = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          context.read<PageBloc>().add(GoToListPage());
          return false;
        },
        child: BlocListener<ViewUpdateBloc, ViewUpdateState>(
            listener: (_, state) {
              if (state is ViewUpdateLoading) {
                isLoading = true;
                setState(() {});
              }

              if (state is ViewDetailSuccess) {
                data = state.list;
                fullName.text = data!.fullName;
                email.text = data!.email;
                gender.text = data!.gender == 1 ? "Pria" : "Wanita";
                dob.text = data!.dob ?? "";
                isLoading = false;
                genderId = data!.gender;
                setState(() {});
              }

              if (state is UpdateDataSuccess) {
                Flushbar(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    titleText: Text("Berhasil", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                    messageText: Text("Update data berhasil", style: TextStyle(color: Colors.white, fontSize: 16)),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.red,
                    flushbarPosition: FlushbarPosition.TOP
                );
                context.read<ViewUpdateBloc>().add(ViewDetailGetData(widget.id));
                isLoading = false;
                title = "Detail User";
                setState(() {});
              }

              if (state is ViewUpdateFailed) {
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
                                  child: Text(title)
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
                          : (data != null && data!.id.toString().isNotEmpty
                          ? ListView(
                          padding: EdgeInsets.only(top: 25),
                          children: [
                            Text("Nama Panjang"),
                            TextField(
                              readOnly: title == "Detail User" ? true : false,
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
                              readOnly: title == "Detail User" ? true : false,
                              controller: email,
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text("Jenis Kelamin")
                            ),
                            TextField(
                              readOnly: true,
                              controller: gender,
                              onTap: () => title == "Detail User" ? null : getGender(),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text("Tanggal Lahir")
                            ),
                            TextField(
                              readOnly: true,
                              controller: dob,
                              onTap: () => title == "Detail User" ? null : pickDob(context),
                            ),
                            if (title != "Detail User")
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                          ]
                      )
                          : Container(
                          child: Text("Data Kosong", style: TextStyle(fontSize: 35))
                      ))
                  ),
                  GestureDetector(
                      onTap: () {
                        if (title == "Detail User") {
                          title = "Update User";
                        } else {
                          updateData();
                          // title = "Detail User";
                        }
                        setState(() {});
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.075,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.1, top: MediaQuery.of(context).size.height * 0.05),
                          color: Colors.blue,
                          alignment: Alignment.center,
                          child: Text(title == "Detail User" ? "Update Data" : "Submit")
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

  void updateData() {
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
        context.read<ViewUpdateBloc>().add(UpdateDetailData(
          widget.id,
          fullName.text,
          email.text,
          md5.convert(utf8.encode(password.text)).toString(),
          genderId ?? data!.gender,
          dob.text
        ));
      }
    }
  }
}
