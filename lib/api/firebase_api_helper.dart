// import 'package:icar/api/api_response_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreHelper {
//   static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   static Future<ApiResponseModel> sendRequest({
//     required String method,
//     required String collectionPath,
//     dynamic data,
//     String? documentId,
//   }) async {
//     try {
//       // Log the collection path to verify its correctness
//       print('Collection Path: $collectionPath');

//       // Ensure the collection path is valid before proceeding
//       if (collectionPath.isEmpty || !isValidCollectionPath(collectionPath)) {
//         throw AssertionError('Invalid collection path: $collectionPath');
//       }

//       // Handle different Firestore methods
//       switch (method.toLowerCase()) {
//         case 'get':
//           if (documentId != null) {
//             return await _getDocument(collectionPath, documentId);
//           } else {
//             return await _getCollection(collectionPath);
//           }
//         case 'post':
//           if (documentId != null) {
//             return await _setDocument(collectionPath, documentId, data);
//           } else {
//             return await _addDocument(collectionPath, data);
//           }
//         case 'delete':
//           if (documentId != null) {
//             return await _deleteDocument(collectionPath, documentId);
//           } else {
//             throw AssertionError('Document ID required for delete');
//           }
//         default:
//           throw AssertionError('Unsupported method: $method');
//       }
//     } catch (e) {
//       return ApiResponseModel(
//         status: false,
//         message: 'Error occurred: $e',
//       );
//     }
//   }

//   static bool isValidCollectionPath(String path) {
//     // A very basic validation check. Adjust based on your needs.
//     // A valid path typically should not be empty and should not contain any restricted characters.
//     return path.isNotEmpty && !path.contains(' ');
//   }

//   // Example Firestore operations
//   static Future<ApiResponseModel> _getDocument(String collectionPath, String documentId) async {
//     try {
//       final documentSnapshot = await _firestore.collection(collectionPath).doc(documentId).get();
//       return ApiResponseModel(
//         status: true,
//         data: documentSnapshot.data(),
//       );
//     } catch (e) {
//       return ApiResponseModel(
//         status: false,
//         message: 'Error occurred: $e',
//       );
//     }
//   }

//   static Future<ApiResponseModel> _getCollection(String collectionPath) async {
//     try {
//       final querySnapshot = await _firestore.collection(collectionPath).get();
//       return ApiResponseModel(
//         status: true,
//         data: querySnapshot.docs.map((doc) => doc.data()).toList(),
//       );
//     } catch (e) {
//       return ApiResponseModel(
//         status: false,
//         message: 'Error occurred: $e',
//       );
//     }
//   }

//   static Future<ApiResponseModel> _setDocument(String collectionPath, String documentId, Map<String, dynamic> data) async {
//     try {
//       print('================path$collectionPath');
//       await _firestore.collection(collectionPath).doc(documentId).set(data);
//       return ApiResponseModel(
//         status: true,
//         message: 'Document successfully created',
//       );
//     } catch (e) {
//       return ApiResponseModel(
//         status: false,
//         message: 'Error occurred: $e',
//       );
//     }
//   }

//   static Future<ApiResponseModel> _addDocument(String collectionPath, Map<String, dynamic> data) async {
//     try {
//       final docRef = await _firestore.collection(collectionPath).add(data);
//       return ApiResponseModel(
//         status: true,
//         message: 'Document successfully added with ID: ${docRef.id}',
//       );
//     } catch (e) {
//       return ApiResponseModel(
//         status: false,
//         message: 'Error occurred: $e',
//       );
//     }
//   }

//   static Future<ApiResponseModel> _deleteDocument(String collectionPath, String documentId) async {
//     try {
//       await _firestore.collection(collectionPath).doc(documentId).delete();
//       return ApiResponseModel(
//         status: true,
//         message: 'Document successfully deleted',
//       );
//     } catch (e) {
//       return ApiResponseModel(
//         status: false,
//         message: 'Error occurred: $e',
//       );
//     }
//   }
// }
