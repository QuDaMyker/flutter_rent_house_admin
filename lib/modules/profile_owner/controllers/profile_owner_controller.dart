import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter_smart_rent_admin/core/model/account/Account.dart';
import 'package:flutter_smart_rent_admin/core/model/room/room.dart';
import 'package:flutter_smart_rent_admin/core/resources/auth_methods.dart';
import 'package:flutter_smart_rent_admin/core/values/KEY_VALUE.dart';

class ProfileOwnerController extends GetxController {
  final String uidOwner;
  ProfileOwnerController({required this.uidOwner});
  var profileOwner = Rx<Account?>(null);
  var isLoading = false.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxList<Room> listRoom = <Room>[].obs;

  @override
  void onInit() {
    getProfile(uidOwner);
    getListRoom();
    super.onInit();
  }

  Future<void> getProfile(String uid) async {
    isLoading.value = true;
    profileOwner.value = await AuthMethods.getUserDetails(uid);
    isLoading.value = false;
  }

  Future<void> getListRoom() async {
    isLoading.value = true;
    update();
    try {
      final querySnapshot = await firestore
          .collection(KeyValue.KEY_COLLECTION_ROOM)
          .where('createdByUid', isEqualTo: uidOwner)
          .get();
      listRoom.value = querySnapshot.docs
          .map(
            (e) => Room.fromJson(
              e.data(),
            ),
          )
          .toList();
      update();
      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
