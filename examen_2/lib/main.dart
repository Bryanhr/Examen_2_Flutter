import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Office Food'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  String nombres;
  String pedido;
  double precio;
  int cantidad;
  double total = 0;
  String mensaje = "";
  double descuento = 0;
  double totalfin = 0;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final txtNombre = TextEditingController();
  final txtPedido = TextEditingController();
  final txtPrecio = TextEditingController();
  final txtCantidad = TextEditingController();

  void _calcularTotal() {
    setState(() {
      widget.mensaje = "Falta ingresar dato";
      widget.nombres = txtNombre.text;
      widget.pedido = txtPedido.text;
      widget.precio = double.parse(txtPrecio.text);
      widget.cantidad = int.parse(txtCantidad.text);

      widget.total = widget.precio * widget.cantidad;

      if (widget.total > 500) {
        widget.descuento = widget.total * 0.05;
      }

      if (val0 == true) {
        widget.totalfin = (widget.total + 20) - widget.descuento;
      } else
        widget.totalfin = widget.total - widget.descuento;
    });
  }

  bool val0 = false;

  void cambioValor(bool valor) {
    setState(() {
      val0 = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Bienvenido por favor rellene sus datos para completar su pedido.",
                style: TextStyle(fontSize: 30, fontFamily: "rbold"),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  TextField(
                    controller: txtNombre,
                    decoration: InputDecoration(
                        errorText:
                            txtNombre.toString() == "" ? widget.mensaje : null,
                        hintText: "Ingresar nombres",
                        labelText: "Nombres"),
                  ),
                  TextField(
                    controller: txtPedido,
                    decoration: InputDecoration(
                        errorText:
                            txtPedido.toString() == "" ? widget.mensaje : null,
                        hintText: "Ingresar pedido",
                        labelText: "Pedido"),
                  ),
                  TextField(
                    controller: txtPrecio,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        errorText:
                            txtPrecio.toString() == "" ? widget.mensaje : null,
                        hintText: "Ingresar precio",
                        labelText: "Precio"),
                  ),
                  TextField(
                    controller: txtCantidad,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                    decoration: InputDecoration(
                        errorText: txtCantidad.toString() == ""
                            ? widget.mensaje
                            : null,
                        hintText: "Ingresar cantidad",
                        labelText: "Cantidad"),
                  ),
                  Text("Total: " + widget.total.toString()),
                  Text("Descuento: " + widget.descuento.toString()),
                  Text(
                    "Delivery:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: val0,
                    onChanged: cambioValor,
                    activeColor: Colors.lightGreen,
                  ),
                  Text("Total a pagar: " + widget.totalfin.toString()),
                  RaisedButton(
                    color: Colors.yellow,
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 18, fontFamily: "rbold"),
                    ),
                    onPressed: _calcularTotal,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
