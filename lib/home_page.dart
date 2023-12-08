import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _result='';
  Future<void> scanBarcode() async {
    String barcodeScaned;
    try{
      barcodeScaned = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      debugPrint(barcodeScaned);
    } on PlatformException{
      barcodeScaned='Error';
    }
    if(!mounted) return;
    setState(() {
      _result = barcodeScaned;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Booking Checker",style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white
        )),
      ),
      body: showScanner(_result),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: scanBarcode,
        tooltip: 'Increment',
        child: const Icon(Icons.document_scanner_outlined,color: Colors.white),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget showScanner(String qrText) {
    List<String> separatedStrings = qrText.split("#");
    return (separatedStrings.length>=5)
        ?ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0,right: 10.0,left: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Table Name: ",
                                  style: GoogleFonts.aladin(
                                    color: Colors.deepOrange,
                                    fontSize: 28,
                                  ),
                                ),
                                Text(separatedStrings[0],
                                  style: GoogleFonts.aladin(
                                    color: Colors.deepOrange,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Table: ",
                                  style: GoogleFonts.aladin(
                                    color: Colors.deepOrange,
                                    fontSize: 28,
                                  ),
                                ),
                                Text(separatedStrings[1],
                                  style: GoogleFonts.aladin(
                                    color: Colors.deepOrange,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Number Of Seats: ",
                                  style: GoogleFonts.aladin(
                                    color: Colors.deepOrange,
                                    fontSize: 28,
                                  ),
                                ),
                                Text(separatedStrings[2],
                                  style: GoogleFonts.aladin(
                                    color: Colors.deepOrange,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Date:",
                                  style: GoogleFonts.aladin(
                                    color: Colors.deepOrange,
                                    fontSize: 28,
                                  ),
                                ),
                                Text(separatedStrings[3],
                                  style: GoogleFonts.aladin(
                                    color: Colors.deepOrange,
                                    fontSize: 25,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Start Time: ",
                                  style: GoogleFonts.aladin(
                                    color: Colors.deepOrange,
                                    fontSize: 28,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(separatedStrings[4],
                                      style: GoogleFonts.aladin(
                                        color: Colors.deepOrange,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("End Time: ",
                                  style: GoogleFonts.aladin(
                                    color: Colors.deepOrange,
                                    fontSize: 28,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(separatedStrings[5],
                                      style: GoogleFonts.aladin(
                                        color: Colors.deepOrange,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    )
        :Container();
  }
}