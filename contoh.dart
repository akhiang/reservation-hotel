// models
import 'package:flutter/material.dart';

class Room {
  int id;
  String name;
  Room({this.id, this.name});
}

class CartRoom {
  Room room;
  PreferensiRoom preferensiRoom;
  int quantity;
  CartRoom({
    this.room,
    this.preferensiRoom,
    this.quantity,
  });
}

class PreferensiRoom {
  bool isSelected;
  int quantity;
  bool isSmoking;
  PreferensiRoom({
    this.isSelected,
    this.quantity,
    this.isSmoking,
  });
}

// widget
class WidgetCartRoom {
  CartRoom cartRoom;
  Function onTap;
  WidgetCartRoom({
    this.cartRoom,
    this.onTap,
  });

  Widget build() {
    return Column(children: [
      Text(cartRoom.room.name),
      cartRoom.preferensiRoom == null ? Text("Pilih") : Text(" [+] 0 [-] "),
    ]);
  }
}

class WidgetButtonPilih {
  Function onTap;
  WidgetButtonPilih({this.onTap});
}

// services
void applyPreferensyRoomToCartRoom(int index, PreferensiRoom preferensiRoom) {
  BlocCartRoom().listOfCartRoom[index].preferensiRoom = preferensiRoom;
  // goback to pilih kamar
}

// bloc
class BlocCartRoom {
  List<CartRoom> listOfCartRoom = [];
}

main() {
  List<CartRoom> listOfCartRoom = [];

  // halaman daftar kamar, title: Pilih Kamar
  gotoPreferensiRoom(int index) {
    //
  }
  listOfCartRoom.map((item) {
    WidgetCartRoom(
        cartRoom: item,
        onTap: () {
          // pindah halaman preferensi, bawa data cartRoom
          int index = listOfCartRoom.indexOf(item);
          gotoPreferensiRoom(index);
        });
  }).toList();

  // halaman preferensi, title: Preferensi Kamar
  int index;
  WidgetButtonPilih(onTap: () {
    applyPreferensyRoomToCartRoom(
        index,
        PreferensiRoom(
          isSelected: true,
          isSmoking: true,
          quantity: 1,
        ));
  });
}
