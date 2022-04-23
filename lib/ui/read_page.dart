part of 'pages.dart';

class ReadPage extends StatefulWidget {

  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
  List<ReadResponseDataRows>? list;
  int? pageNow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<PageBloc>().add(GoToCreatePage()),
        child: Icon(Icons.add),
      ),
      body: BlocListener<ListBloc, ListState>(
        listener: (_, state) {
          if (state is ListLoading) {
            isLoading = true;
            setState(() {});
          }

          if (state is ListSuccess) {
            list = state.list;
            isLoading = false;
            pageNow = state.page;
            setState(() {});
          }

          if (state is ListFailed) {

          }
        },
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
              child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                          child: Text("List User")
                        )
                    )
                  ]
              )
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05, left: MediaQuery.of(context).size.width * 0.05),
              child: isLoading
                  ? SpinKitFadingCircle(color: Colors.black)
                  : ListView(
                padding: EdgeInsets.zero,
                children: (list != null && list!.isNotEmpty)
                    ? list!.map((e) => GestureDetector(
                  onTap: () => context.read<PageBloc>().add(GoToDetailUpdatePage(e.id)),
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama Panjang: " + e.fullName),
                          Text("Email: "+e.email),
                          Text("Jenis Kelamin: "+(e.gender == 1 ? "Pria" : "Wanita")),
                          Text("Tempat Tanggal Lahir: "+e.dob),
                          Divider()
                        ]
                    )
                  )
                )).toList() : [],
              )
            ),
            if (pageNow != null)
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (pageNow! > 1) GestureDetector(
                      onTap: () => context.read<ListBloc>().add(ListGetData(pageNow! - 2, 10)),
                      child: Container(
                        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.2),
                        child: Icon(Icons.navigate_before, size: 40),
                      )
                    ),
                    Container(
                        child: Text(pageNow.toString())
                    ),
                    if (list != null && list!.length == 10) GestureDetector(
                        onTap: () => context.read<ListBloc>().add(ListGetData(pageNow!, 10)),
                        child: Container(
                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.2),
                          child: Icon(Icons.navigate_next, size: 40)
                      )
                    )
                  ]
              )
            )
          ]
        )

      ),
    );
  }
}
